#include <QApplication>
#include <QPushButton>
#include <QHBoxLayout>
#include <QVBoxLayout>
#include <QStandardPaths>
#include <QDebug>
#include <QDir>
#include <QSqlDatabase>
#include <QSqlQuery>


#define APP_NAME "qt-sandbox"

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

/**
 * Check directory is writeable, if it doesn't exist, create it first.
 **/
void createDirOrCheckWriteable(QDir dir) {
    if (!dir.exists()) {
        QLOG_DEBUG() << "About to create directory " << dir;
        if (!dir.mkpath(dir.path())) {
            QLOG_FATAL() << "Failed to create directory '" << dir.path() << "'.  Aborting program.";
            exit(16);
        }
    }
    //checkExistingWriteableDir(dir);
}

void trySomeDbStuff(QString dataLocation) {
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName(dataLocation + "data.db");
    if (!db.open()) {
        qDebug() << "Error: connection with database fail";
    } else {
        qDebug() << "Database: connection ok";
    }
    QSqlQuery query;
    query.exec("drop table if exists person");
    query.exec("create table person (id int primary key, firstname varchar(20), lastname varchar(20))");
}



int main(int argc, char *argv[]) {
    QApplication app(argc, argv);
    QCoreApplication::setApplicationName(APP_NAME);

    // Horizontal layout with 3 buttons
    QHBoxLayout *hLayout = new QHBoxLayout;
    QPushButton *b1 = new QPushButton("Sand");
    QPushButton *b2 = new QPushButton("Box");
    QPushButton *b3 = new QPushButton("Play");
    hLayout->addWidget(b1);
    hLayout->addWidget(b2);
    hLayout->addWidget(b3);

    // Vertical layout with 3 buttons
    QVBoxLayout *vLayout = new QVBoxLayout;
    QPushButton *b4 = new QPushButton("Ground");
    QPushButton *b5 = new QPushButton("...");
    QPushButton *b6 = new QPushButton("/--\\");
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
    w->setWindowTitle("qt-sandbox");

    // Display
    w->show();


    const QString configLocation = slashTerminatePath(
        QStandardPaths::writableLocation(QStandardPaths::AppConfigLocation));
    const QString dataLocation = slashTerminatePath(QStandardPaths::writableLocation(QStandardPaths::AppDataLocation));
    const QString applicationDirPath = slashTerminatePath(getDefaultProgramDirPath());
    QLOG_DEBUG() << "Config directory: " << configLocation;
    QLOG_DEBUG() << "Data directory: " << dataLocation;
    QLOG_DEBUG() << "Program data directory: " << applicationDirPath;

    const QString imagesPath = applicationDirPath + "images";
    checkExistingReadableDir(QDir(imagesPath));
    QLOG_DEBUG() << "OK.";
    createDirOrCheckWriteable(QDir(dataLocation));

    trySomeDbStuff(dataLocation);

    // Event loop
    return app.exec();
}
