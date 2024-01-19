# Documentation for OpenAPI Single C++ Client Generator

# General Information

This is a C++ client generator that utilizes the json.hpp from nlohmann::json (https://github.com/nlohmann/json).
The generator is called cpp-single becuase the C++ code only has to include a single header file (json.hpp) for
all JSON processing. Obtain json.hppp and no other code changes are required.

## OpenAPI Petstore 1.0.0 Single Client C++ 

## Project Structure
```
samples/client/petstore/cpp/single/
├── Models
├── README.md
```

## Documentation for API Endpoints

All URIs are relative to *http://petstore.swagger.io/v2*




|Method | HTTP request | Description|
|------------- | ------------- | -------------|
|*addPet* | *POST* /pet | Add a new pet to the store.|
|*deletePet* | *DELETE* /pet/{petId} | Deletes a pet.|
|*findPetsByStatus* | *GET* /pet/findByStatus | Finds Pets by status.|
|*findPetsByTags* | *GET* /pet/findByTags | Finds Pets by tags.|
|*getPetById* | *GET* /pet/{petId} | Find pet by ID.|
|*updatePet* | *PUT* /pet | Update an existing pet.|
|*updatePetWithForm* | *POST* /pet/{petId} | Updates a pet in the store with form data.|
|*uploadFile* | *POST* /pet/{petId}/uploadImage | uploads an image.|


|Method | HTTP request | Description|
|------------- | ------------- | -------------|
|*deleteOrder* | *DELETE* /store/order/{orderId} | Delete purchase order by ID.|
|*getInventory* | *GET* /store/inventory | Returns pet inventories by status.|
|*getOrderById* | *GET* /store/order/{orderId} | Find purchase order by ID.|
|*placeOrder* | *POST* /store/order | Place an order for a pet.|


|Method | HTTP request | Description|
|------------- | ------------- | -------------|
|*createUser* | *POST* /user | Create user.|
|*createUsersWithArrayInput* | *POST* /user/createWithArray | Creates list of users with given input array.|
|*createUsersWithListInput* | *POST* /user/createWithList | Creates list of users with given input array.|
|*deleteUser* | *DELETE* /user/{username} | Delete user.|
|*getUserByName* | *GET* /user/{username} | Get user by user name.|
|*loginUser* | *GET* /user/login | Logs user into the system.|
|*logoutUser* | *GET* /user/logout | Logs out current logged in user session.|
|*updateUser* | *PUT* /user/{username} | Updated user.|


## Class Descriptions

|Class | Description|
|------------- | -------------|
|*ApiResponse* | Describes the result of uploading an image resource.|
|*Category* | A category for a pet.|
|*Order* | An order for a pets from the pet store.|
|*Pet* | A pet for sale in the pet store.|
|*Tag* | A tag for a pet.|
|*User* | A User who is purchasing from the pet store.|

