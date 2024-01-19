/**
 * OpenAPI Petstore
 * This is a sample server Petstore server. For this sample, you can use the api key `special-key` to test the authorization filters.
 *
 * v1.0.0
 *
 * NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
 *
 * Example: openapi-generator-cli generate -i openapi.yaml -g cpp-single -o src/cpp/client-single
 *
 * DO NOT edit these files manually.
 */


#include "Order.h"

using namespace SingleCppClient;

Order::Order()
{
    id = long(0);
    petId = long(0);
    quantity = int(0);
    shipDate = std::string();
    status = std::string();
    complete = bool(false);
}

Order::Order(std::string jsonString)
{
    this->fromJson(jsonString);
}

Order::~Order()
{
}

void Order::fromJson(std::string jsonObj)
{
    nlohmann::json object = nlohmann::json::parse(jsonObj);
    const char *idKey = "id";

    if (object.contains(idKey))
    {
        nlohmann::json value = object[idKey];
        jsonToValue(&id, value, "long");

    }

    const char *petIdKey = "petId";

    if (object.contains(petIdKey))
    {
        nlohmann::json value = object[petIdKey];
        jsonToValue(&petId, value, "long");

    }

    const char *quantityKey = "quantity";

    if (object.contains(quantityKey))
    {
        nlohmann::json value = object[quantityKey];
        jsonToValue(&quantity, value, "int");

    }

    const char *shipDateKey = "shipDate";

    if (object.contains(shipDateKey))
    {
        nlohmann::json value = object[shipDateKey];
        jsonToValue(&shipDate, value, "std::string");

    }

    const char *statusKey = "status";

    if (object.contains(statusKey))
    {
        nlohmann::json value = object[statusKey];
        jsonToValue(&status, value, "std::string");

    }

    const char *completeKey = "complete";

    if (object.contains(completeKey))
    {
        nlohmann::json value = object[completeKey];
        jsonToValue(&complete, value, "bool");

    }

}

nlohmann::json Order::toJson()
{
    nlohmann::json object = nlohmann::json::object();
    object["id"] = getId();
    object["petId"] = getPetId();
    object["quantity"] = getQuantity();
    object["shipDate"] = getShipDate();
    object["status"] = getStatus();
    object["complete"] = isComplete();
    return object;
}

 long Order::getId()
{
    return id;
}

void Order::setId(long  id)
{
    this->id = id;
}

 long Order::getPetId()
{
    return petId;
}

void Order::setPetId(long  petId)
{
    this->petId = petId;
}

 int Order::getQuantity()
{
    return quantity;
}

void Order::setQuantity(int  quantity)
{
    this->quantity = quantity;
}

 std::string Order::getShipDate()
{
    return shipDate;
}

void Order::setShipDate(std::string  shipDate)
{
    this->shipDate = shipDate;
}

 std::string Order::getStatus()
{
    return status;
}

void Order::setStatus(std::string  status)
{
    this->status = status;
}

 bool Order::isComplete()
{
    return complete;
}

void Order::setComplete(bool  complete)
{
    this->complete = complete;
}

