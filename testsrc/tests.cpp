#include <QtTest/QtTest>
#include <QObject>
#include <QString>

#include "tests.h"
#include "../src/colormenu.h"

Tests::Tests(QObject *parent) :
    QObject(parent)
{

}

void Tests::xx()
{

}

void Tests::toUpper()
{
    QString str = "Hello";
    QCOMPARE(str.toUpper(), QString("HELLO"));
}
void Tests::colorMenu()
{
    ColorMenu colormenu;
    QStringList colorNames = colormenu.colorNames();
    QCOMPARE(colorNames.first(), QString("black"));
}

QTEST_MAIN(Tests)
