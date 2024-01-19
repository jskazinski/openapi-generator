package org.openapitools.codegen.cpp.single;

import org.openapitools.codegen.AbstractOptionsTest;
import org.openapitools.codegen.CodegenConfig;
import org.openapitools.codegen.languages.CppSingleClientCodegen;
import org.openapitools.codegen.options.CppSingleClientCodegenOptionsProvider;

import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;

public class CppSingleClientCodegenOptionsTest extends AbstractOptionsTest {
    private CppSingleClientCodegen codegen = mock(CppSingleClientCodegen.class, mockSettings);

    public CppSingleClientCodegenOptionsTest() {
        super(new CppSingleClientCodegenOptionsProvider());
    }

    @Override
    protected CodegenConfig getCodegenConfig() {
        return codegen;
    }

    @SuppressWarnings("unused")
    @Override
    protected void verifyOptions() {
        // TODO: Complete options using Mockito
        // verify(codegen).someMethod(arguments)
    }
}

