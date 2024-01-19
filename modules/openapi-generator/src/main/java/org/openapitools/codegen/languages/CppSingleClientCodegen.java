/*
 * Copyright 2018 OpenAPI-Generator Contributors (https://openapi-generator.tech)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.openapitools.codegen.languages;

import org.openapitools.codegen.*;
import io.swagger.v3.oas.models.media.Schema;

import io.swagger.v3.parser.util.SchemaTypeUtil;
import org.openapitools.codegen.meta.features.*;
import org.openapitools.codegen.meta.GeneratorMetadata;
import org.openapitools.codegen.meta.Stability;
import org.openapitools.codegen.model.ModelMap;
import org.openapitools.codegen.model.OperationsMap;
import org.openapitools.codegen.utils.ModelUtils;

import java.io.File;
import java.util.*;

import org.apache.commons.lang3.StringUtils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CppSingleClientCodegen extends AbstractCppCodegen implements CodegenConfig {
    public static final String PROJECT_NAME = "CppSingleClient";

    final Logger LOGGER = LoggerFactory.getLogger(CppSingleClientCodegen.class);

    public static final String rootFolder = "";

    @Override
    public CodegenType getTag() {
        return CodegenType.CLIENT;
    }

    /**
     * Configures a friendly name for the generator. This will be used by the
     * generator to select the library with the -g flag.
     *
     * @return the friendly name for the generator
     */
    @Override
    public String getName() {
        return "cpp-single";
    }

    /**
     * Returns human-friendly help for the generator. Provide the consumer with
     * help tips, parameters here
     *
     * @return A string value for the help message
     */
    @Override
    public String getHelp() {
        return "Generates a C++ client leveraging single header file includes.";
    }

    public CppSingleClientCodegen() {
        super();

        modifyFeatureSet(feature -> feature
                .excludeGlobalFeatures(
                        GlobalFeature.XMLStructureDefinitions,
                        GlobalFeature.Callbacks,
                        GlobalFeature.LinkObjects,
                        GlobalFeature.ParameterStyling,
                        GlobalFeature.MultiServer)
                .excludeSchemaSupportFeatures(
                        SchemaSupportFeature.Polymorphism
                )
                .excludeParameterFeatures(
                        ParameterFeature.Cookie,
                        ParameterFeature.Header,
                        ParameterFeature.FormUnencoded,
                        ParameterFeature.FormMultipart,
                        ParameterFeature.Query
                )
                .excludeDataTypeFeatures(
                        DataTypeFeature.Enum,
                        DataTypeFeature.Maps,
                        DataTypeFeature.MapOfCollectionOfEnum,
                        DataTypeFeature.MapOfCollectionOfModel,
                        DataTypeFeature.MapOfCollectionOfPrimitives,
                        DataTypeFeature.MapOfEnum,
                        DataTypeFeature.MapOfModel

                )
                .excludeWireFormatFeatures(
                        WireFormatFeature.XML,
                        WireFormatFeature.PROTOBUF,
                        WireFormatFeature.Custom
                )
                .includeDocumentationFeatures(
                        DocumentationFeature.Readme
                ));

        generatorMetadata = GeneratorMetadata.newBuilder(generatorMetadata)
                .stability(Stability.BETA)
                .build();

        outputFolder = "generated-code" + File.separator + "cpp-single";
        embeddedTemplateDir = templateDir = "cpp-single";

        // API MODEL Classes
        // modelPackage = "";
        modelTemplateFiles.put("api-header.mustache", ".h");
        modelTemplateFiles.put("api-body.mustache", ".cpp");

        // API MODEL Helpers
        supportingFiles.add(new SupportingFile("helpers-header.mustache", "", "Helpers.h"));
        supportingFiles.add(new SupportingFile("helpers-body.mustache", "", "Helpers.cpp"));

        // Config files
        supportingFiles.add(new SupportingFile("README.mustache", rootFolder, "README.md"));

        defaultIncludes = new HashSet<>(
                Arrays.asList(
                        "bool",
                        "int",
                        "long",
                        "double",
                        "float")
        );
        languageSpecificPrimitives = new HashSet<>(
                Arrays.asList(
                        "bool",
                        "int",
                        "long",
                        "double",
                        "float",
                        "std::string")
        );

        super.typeMapping = new HashMap<>();
        typeMapping.put("string", "std::string");
        typeMapping.put("integer", "int");
        typeMapping.put("boolean", "bool");
        typeMapping.put("array", "std::list");
        typeMapping.put("DateTime", "std::string");

        makeTypeMappings();
    }

    @Override
    public String getTypeDeclaration(String str) {
        return str;
    }

    private void makeTypeMappings() {
        // Types
        String cpp_array_type = "std::list";
        typeMapping = new HashMap<>();

        typeMapping.put("string", "std::string");
        typeMapping.put("integer", "int");
        typeMapping.put("float", "float");
        typeMapping.put("long", "long");
        typeMapping.put("boolean", "bool");
        typeMapping.put("double", "double");
        typeMapping.put("array", cpp_array_type);
        typeMapping.put("number", "long");
        typeMapping.put("binary", "std::string");
        typeMapping.put("password", "std::string");
        typeMapping.put("file", "std::string");
        typeMapping.put("DateTime", "std::string");
        typeMapping.put("Date", "std::string");
        typeMapping.put("UUID", "std::string");
        typeMapping.put("URI", "std::string");
    }

    @Override
    public void processOpts() {
        super.processOpts();
    }

    @Override
    public String toInstantiationType(Schema p) {
        if (ModelUtils.isArraySchema(p)) {
            return instantiationTypes.get("array");
        } else {
            return null;
        }
    }

    @Override
    public String getTypeDeclaration(Schema p) {
        String openAPIType = getSchemaType(p);
        if (languageSpecificPrimitives.contains(openAPIType)) {
            return toModelName(openAPIType);
        } else {
            return openAPIType;
        }
    }

    @Override
    public String getSchemaType(Schema p) {
        String openAPIType = super.getSchemaType(p);
        String type = null;
        if (typeMapping.containsKey(openAPIType)) {
            type = typeMapping.get(openAPIType);
            if (languageSpecificPrimitives.contains(type)) {
                return toModelName(type);
            }
        } else {
            type = openAPIType;
        }
        return toModelName(type);
    }

    @Override
    public String toModelName(String type) {
        if (typeMapping.keySet().contains(type) ||
                typeMapping.values().contains(type) ||
                defaultIncludes.contains(type) ||
                languageSpecificPrimitives.contains(type)) {
            return type;
        } else {
            return Character.toUpperCase(type.charAt(0)) + type.substring(1);
        }
    }

    @Override
    public String toModelImport(String name) {
        if (name.equals("std::string")) {
            return "#include <string>";
        } else if (name.equals("std::list")) {
            return "#include <list>";
        } else if (name.equals("Map")) {
            return "#include <map>";
        }
        return "#include \"" + name + ".h\"";
    }

    @Override
    public String toApiImport(String name) {
        return super.toApiImport(name);
    }

    @Override
    public String toVarName(String name) {
        String paramName = name.replaceAll("[^a-zA-Z0-9_]", "");
        if (name.length() > 0) {
            paramName = Character.toLowerCase(paramName.charAt(0)) + paramName.substring(1);
        }
        if (isReservedWord(paramName)) {
            return escapeReservedWord(paramName);
        }
        return paramName;
    }

    @Override
    public String toDefaultValue(Schema p) {
        if (ModelUtils.isBooleanSchema(p)) {
            return "bool(false)";
        } else if (ModelUtils.isNumberSchema(p)) {
            return "float(0)";
        } else if (ModelUtils.isIntegerSchema(p)) {
            if (SchemaTypeUtil.INTEGER64_FORMAT.equals(p.getFormat())) {
                return "long(0)";
            }
            return "int(0)";
        } else if (ModelUtils.isArraySchema(p)) {
            return "std::list";
        } else if (!StringUtils.isEmpty(p.get$ref())) {
            return toModelName(ModelUtils.getSimpleRef(p.get$ref())) + "()";
        } else if (ModelUtils.isDateSchema(p) || ModelUtils.isDateTimeSchema(p)) {
            return "std::string()";
        } else if (ModelUtils.isStringSchema(p)) {
            return "std::string()";
        }
        return "null";
    }

    @Override
    public OperationsMap postProcessOperationsWithModels(OperationsMap objs, List<ModelMap> allModels) {
        objs = super.postProcessOperationsWithModels(objs, allModels);
        removeImport(objs, "#include <list>");
        return objs;
    }

}

