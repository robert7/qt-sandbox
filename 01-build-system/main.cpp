#include <QApplication>
#include <QPushButton>
#include <QHBoxLayout>
#include <QVBoxLayout>
#include <QStandardPaths>
#include <QDebug>

#define APP_NAME "myprog"

int main(int argc, char* argv[])
{
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
    const QString applicationDirPath = QCoreApplication::applicationDirPath();
    qDebug() << "configLocation" << configLocation;
    qDebug() << "dataLocation" << dataLocation;
    qDebug() << "applicationDirPath" << applicationDirPath;

    // Event loop
    return app.exec();
}
