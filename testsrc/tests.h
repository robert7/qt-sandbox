#ifndef QT_SANDBOX_TESTS_H
#define QT_SANDBOX_TESTS_H

#include <QObject>

class TestQString: public QObject
{
    Q_OBJECT

public:
    //TestQString();           // Generic constructor

    Q_INVOKABLE explicit TestQString(QObject *parent=Q_NULLPTR);
    virtual ~TestQString() {};
    virtual void xx();

private slots:
    void toUpper();

};

#endif //QT_SANDBOX_TESTS_H
