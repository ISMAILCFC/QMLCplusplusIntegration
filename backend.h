
#include <QObject>
#include <QString>
#include <QVector>

class BackEndClass : public QObject {
    Q_OBJECT

    //Accessing method to the message variable
    Q_PROPERTY(QString Message READ message WRITE setMessage NOTIFY messageChanged)
public:
    explicit BackEndClass(QObject *parent = nullptr);

    //returns the current counter value
    Q_INVOKABLE int incrementCounter();


    //setter
    void setMessage(const QString &msg);

    //getter

    QString message();


signals:
    //signal to variable
    void messageChanged();

public slots:
    void resetCounter();

private:
    //our variable
    QString Message ;

    //counter
    int Counter = 0;
};


