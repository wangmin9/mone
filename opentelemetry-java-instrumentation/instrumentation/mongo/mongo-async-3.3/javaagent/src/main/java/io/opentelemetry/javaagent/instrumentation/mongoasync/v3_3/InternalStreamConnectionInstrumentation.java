/*
 * Copyright The OpenTelemetry Authors
 * SPDX-License-Identifier: Apache-2.0
 */

package io.opentelemetry.javaagent.instrumentation.mongoasync.v3_3;

import static net.bytebuddy.matcher.ElementMatchers.isMethod;
import static net.bytebuddy.matcher.ElementMatchers.named;
import static net.bytebuddy.matcher.ElementMatchers.takesArgument;

import com.mongodb.async.SingleResultCallback;
import io.opentelemetry.javaagent.extension.instrumentation.TypeInstrumentation;
import io.opentelemetry.javaagent.extension.instrumentation.TypeTransformer;
import io.opentelemetry.javaagent.instrumentation.api.Java8BytecodeBridge;
import net.bytebuddy.asm.Advice;
import net.bytebuddy.description.type.TypeDescription;
import net.bytebuddy.matcher.ElementMatcher;

final class InternalStreamConnectionInstrumentation implements TypeInstrumentation {

  @Override
  public ElementMatcher<TypeDescription> typeMatcher() {
    return named("com.mongodb.connection.InternalStreamConnection");
  }

  @Override
  public void transform(TypeTransformer transformer) {
    transformer.applyAdviceToMethod(
        isMethod()
            .and(named("openAsync"))
            .and(takesArgument(0, named("com.mongodb.async.SingleResultCallback"))),
        this.getClass().getName() + "$SingleResultCallbackArg0Advice");
    transformer.applyAdviceToMethod(
        isMethod()
            .and(named("readAsync"))
            .and(takesArgument(1, named("com.mongodb.async.SingleResultCallback"))),
        this.getClass().getName() + "$SingleResultCallbackArg1Advice");
    transformer.applyAdviceToMethod(
        isMethod()
            .and(named("sendMessageAsync"))
            .and(takesArgument(2, named("com.mongodb.async.SingleResultCallback"))),
        this.getClass().getName() + "$SingleResultCallbackArg2Advice");
  }

  @SuppressWarnings("unused")
  public static class SingleResultCallbackArg0Advice {

    @Advice.OnMethodEnter(suppress = Throwable.class)
    public static void wrapCallback(
        @Advice.Argument(value = 0, readOnly = false) SingleResultCallback<Object> callback) {
      callback = new SingleResultCallbackWrapper(Java8BytecodeBridge.currentContext(), callback);
    }
  }

  @SuppressWarnings("unused")
  public static class SingleResultCallbackArg1Advice {

    @Advice.OnMethodEnter(suppress = Throwable.class)
    public static void wrapCallback(
        @Advice.Argument(value = 1, readOnly = false) SingleResultCallback<Object> callback) {
      callback = new SingleResultCallbackWrapper(Java8BytecodeBridge.currentContext(), callback);
    }
  }

  @SuppressWarnings("unused")
  public static class SingleResultCallbackArg2Advice {

    @Advice.OnMethodEnter(suppress = Throwable.class)
    public static void wrapCallback(
        @Advice.Argument(value = 2, readOnly = false) SingleResultCallback<Object> callback) {
      callback = new SingleResultCallbackWrapper(Java8BytecodeBridge.currentContext(), callback);
    }
  }
}
