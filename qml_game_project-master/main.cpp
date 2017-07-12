#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QCursor>
#include <QPixmap>
#include <QDebug>
#include <QFileInfo>
#include <QDir>


int main(int argc, char *argv[])
{   
    QGuiApplication app(argc, argv);

    //QCursor cursorTarget = QPixmap("cursor.png");
    //app.setOverrideCursor(QCursor(cursorTarget));
    //qDebug() << "File location:" << QFileInfo("img/cursor.png").absoluteFilePath();

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
