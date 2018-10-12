#ifndef QT_SANDBOX_TESTS_H
#define QT_SANDBOX_TESTS_H

#include <QObject>

class Tests: public QObject
{
    Q_OBJECT

public:
    //Tests();           // Generic constructor

    Q_INVOKABLE explicit Tests(QObject *parent=Q_NULLPTR);
    virtual ~Tests() {};
    virtual void xx();

private slots:
    void toUpper();

};

#endif //QT_SANDBOX_TESTS_H
