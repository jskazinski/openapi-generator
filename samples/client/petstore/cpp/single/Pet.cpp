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


#include "Pet.h"

using namespace SingleCppClient;

Pet::Pet()
{
    id = long(0);
    category = Category();
    name = std::string();
    photoUrls = std::list<std::string>();
    tags = std::list<Tag>();
    status = std::string();
}

Pet::Pet(std::string jsonString)
{
    this->fromJson(jsonString);
}

Pet::~Pet()
{
}

void Pet::fromJson(std::string jsonObj)
{
    nlohmann::json object = nlohmann::json::parse(jsonObj);
    const char *idKey = "id";

    if (object.contains(idKey))
    {
        nlohmann::json value = object[idKey];
        jsonToValue(&id, value, "long");

    }

    const char *categoryKey = "category";

    if (object.contains(categoryKey))
    {
        nlohmann::json value = object[categoryKey];
        Category* obj = &category;
        obj->fromJson(value.dump());
        
    }

    const char *nameKey = "name";

    if (object.contains(nameKey))
    {
        nlohmann::json value = object[nameKey];
        jsonToValue(&name, value, "std::string");

    }

    const char *photoUrlsKey = "photoUrls";

    if (object.contains(photoUrlsKey))
    {
        nlohmann::json value = object[photoUrlsKey];
        std::list<std::string> photoUrls_list;
        std::string element;
        for (auto& var : object[photoUrlsKey])
        {
            jsonToValue(&element, var, "std::string");
            photoUrls_list.push_back(element);
        }
        photoUrls = photoUrls_list;

    }

    const char *tagsKey = "tags";

    if (object.contains(tagsKey))
    {
        nlohmann::json value = object[tagsKey];
        std::list<Tag> tags_list;
        Tag element;
        for (auto& var : object[tagsKey])
        {
            element.fromJson(var.dump());
            tags_list.push_back(element);
        }
        tags = tags_list;

    }

    const char *statusKey = "status";

    if (object.contains(statusKey))
    {
        nlohmann::json value = object[statusKey];
        jsonToValue(&status, value, "std::string");

    }

}

nlohmann::json Pet::toJson()
{
    nlohmann::json object = nlohmann::json::object();
    object["id"] = getId();
    object["category"] = getCategory().toJson();
    object["name"] = getName();
    std::list<std::string> photoUrls_list = getPhotoUrls();
    nlohmann::json photoUrls_arr = nlohmann::json::array();

    for (auto& var : photoUrls_list)
    {
        photoUrls_arr.push_back(var);
    }
    object["photoUrls"] = photoUrls_arr;


    std::list<Tag> tags_list = getTags();
    nlohmann::json tags_arr = nlohmann::json::array();

    for(auto& var : tags_list)
    {
        Tag obj = var;
        tags_arr.push_back(obj.toJson());
    }
    object["tags"] = tags_arr;
    object["status"] = getStatus();
    return object;
}

 long Pet::getId()
{
    return id;
}

void Pet::setId(long  id)
{
    this->id = id;
}

 Category Pet::getCategory()
{
    return category;
}

void Pet::setCategory(Category  category)
{
    this->category = category;
}

 std::string Pet::getName()
{
    return name;
}

void Pet::setName(std::string  name)
{
    this->name = name;
}

 std::list<std::string> Pet::getPhotoUrls()
{
    return photoUrls;
}

void Pet::setPhotoUrls(std::list <std::string> photoUrls)
{
    this->photoUrls = photoUrls;
}

 std::list<Tag> Pet::getTags()
{
    return tags;
}

void Pet::setTags(std::list <Tag> tags)
{
    this->tags = tags;
}

 std::string Pet::getStatus()
{
    return status;
}

void Pet::setStatus(std::string  status)
{
    this->status = status;
}

