#include <QApplication>
#include <QPushButton>
#include <QHBoxLayout>
#include <QVBoxLayout>
#include <QStandardPaths>
#include <QDebug>
#include <QDir>

#define APP_NAME "myprog"

// just convenience shortcuts so I can easier cut/paste code in this sandbox example
#define QLOG_DEBUG qDebug
#define QLOG_FATAL qDebug

/**
 * Get base path for program data.
 * This is a bit hacky. We try to detec, whenever we are running in std location.
 * If yes, then resolve "1 level up" and share+app name.
 *
 * Else if running in compile dir, then just go 1 level up.
 * @return
 */
QString getDefaultProgramDirPath() {
    QString path = QCoreApplication::applicationDirPath();
    if (path.endsWith("/bin")) {
        // runs in std location
        path.chop(3); // remove 3 chars from end of string
        return path + "share/" + APP_NAME;
    } else {
        return QDir(path + "/..").absolutePath();
    }
}

void checkExistingReadableDir(QDir dir) {
    QString path = dir.path();
    // Windows Check
#ifndef _WIN32
    QLOG_DEBUG() << "Checking read access for directory " << path;
    if (!dir.isReadable()) {
        QLOG_FATAL() << "Directory '" + path + "' does not have read permission.  Aborting program.";
        exit(16);
    }
#endif  // end windows check

    if (!dir.exists()) {
        QLOG_FATAL() << "Directory '" + path + "' does not exist.  Aborting program";
        exit(16);
    }
}

QString slashTerminatePath(QString path) {
    if (!path.endsWith(QDir::separator())) {
        return path + QDir::separator();
    }
    return path;
}

int main(int argc, char *argv[]) {
    QApplication app(argc, argv);
    QCoreApplication::setApplicationName(APP_NAME);

    // Horizontal layout with 3 buttons
    QHBoxLayout *hLayout = new QHBoxLayout;
    QPushButton *b1 = new QPushButton("A");
    QPushButton *b2 = new QPushButton("B");
    QPushButton *b3 = new QPushButton("C");
    hLayout->addWidget(b1);
    hLayout->addWidget(b2);
    hLayout->addWidget(b3);

    // Vertical layout with 3 buttons
    QVBoxLayout *vLayout = new QVBoxLayout;
    QPushButton *b4 = new QPushButton("D");
    QPushButton *b5 = new QPushButton("E");
    QPushButton *b6 = new QPushButton("F");
    vLayout->addWidget(b4);
    vLayout->addWidget(b5);
    vLayout->addWidget(b6);

    // Outer Layer
    QVBoxLayout *mainLayout = new QVBoxLayout;

    // Add the previous two inner layouts
    mainLayout->addLayout(hLayout);
    mainLayout->addLayout(vLayout);

    // Create a widget
    QWidget *w = new QWidget();

    // Set the outer layout as a main layout
    // of the widget
    w->setLayout(mainLayout);

    // Window title
    w->setWindowTitle("layouts");

    // Display
    w->show();


    const QString configLocation = QStandardPaths::writableLocation(QStandardPaths::AppConfigLocation);
    const QString dataLocation = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
    const QString applicationDirPath = getDefaultProgramDirPath();
    QLOG_DEBUG() << "Config directory: " << configLocation;
    QLOG_DEBUG() << "Data directory: " << dataLocation;
    QLOG_DEBUG() << "Program data directory: " << applicationDirPath;

    const QString imagesPath = slashTerminatePath(applicationDirPath) + "images";
    checkExistingReadableDir(QDir(imagesPath));
    QLOG_DEBUG() << "OK.";

    // Event loop
    return app.exec();
}
