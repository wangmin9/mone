/*
 * Copyright The OpenTelemetry Authors
 * SPDX-License-Identifier: Apache-2.0
 */

package io.opentelemetry.javaagent.instrumentation.mongo.v3_1;

import com.mongodb.event.CommandListener;
import io.opentelemetry.api.GlobalOpenTelemetry;
import io.opentelemetry.instrumentation.mongo.v3_1.MongoTracing;

public final class MongoInstrumentationSingletons {

  public static final CommandListener LISTENER =
      MongoTracing.create(GlobalOpenTelemetry.get()).newCommandListener();

  private MongoInstrumentationSingletons() {}
}
