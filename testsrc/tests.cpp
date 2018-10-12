#include <QtTest/QtTest>
#include <QObject>
#include <QString>

#include "tests.h"

TestQString::TestQString(QObject *parent) :
    QObject(parent)
{

}

void TestQString::xx()
{

}

void TestQString::toUpper()
{
    QString str = "Hello";
    QCOMPARE(str.toUpper(), QString("HELLO"));
}

QTEST_APPLESS_MAIN(TestQString)
//#include "tests.moc"
