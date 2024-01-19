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


#ifndef SINGLE_CPP_CLIENT_HELPERS_H_
#define SINGLE_CPP_CLIENT_HELPERS_H_

#include <string>
#include "json.hpp"

bool isprimitive(std::string type);

void jsonToValue(void* target, nlohmann::json value, std::string type);

std::string stringify(long input);

std::string stringify(int input);

std::string stringify(double input);

std::string stringify(float input);

std::string stringify(std::string input);

#endif /* SINGLE_CPP_CLIENT_HELPERS_H_ */
