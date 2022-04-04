#include "backend.h"

BackEndClass :: BackEndClass (QObject *)
{

}

void BackEndClass::resetCounter()
{
    Counter = 1 ;
}

int BackEndClass::incrementCounter()
{
    Counter += 1;
    return Counter;
}

QString BackEndClass::message()
{
    return Message;
}

void BackEndClass::setMessage(const QString &msg)
{
    Message = msg;
}
