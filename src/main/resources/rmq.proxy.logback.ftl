<?xml version="1.0" encoding="UTF-8"?>
<!--
  Licensed to the Apache Software Foundation (ASF) under one or more
  contributor license agreements.  See the NOTICE file distributed with
  this work for additional information regarding copyright ownership.
  The ASF licenses this file to You under the Apache License, Version 2.0
  (the "License"); you may not use this file except in compliance with
  the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
  -->

<configuration scan="true" scanPeriod="30 seconds">

    <appender name="RocketmqProxyAppender_inner"
              class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}proxy.log</file>
        <append>true</append>
        <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
            <fileNamePattern>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}otherdays${fileSeparator}proxy.%i.log.gz</fileNamePattern>
            <minIndex>1</minIndex>
            <maxIndex>10</maxIndex>
        </rollingPolicy>
        <triggeringPolicy class="ch.qos.logback.core.rolling.SizeBasedTriggeringPolicy">
            <maxFileSize>128MB</maxFileSize>
        </triggeringPolicy>
        <encoder>
            <pattern>%d{yyy-MM-dd HH:mm:ss,GMT+8} %p %t - %m%n</pattern>
            <charset class="java.nio.charset.Charset">UTF-8</charset>
        </encoder>
    </appender>
    <appender name="RocketmqProxyAppender" class="ch.qos.logback.classic.AsyncAppender">
        <appender-ref ref="RocketmqProxyAppender_inner"/>
    </appender>

    <appender name="RocketmqProxyWatermarkAppender_inner"
              class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}proxy_watermark.log</file>
        <append>true</append>
        <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
            <fileNamePattern>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}otherdays${fileSeparator}proxy_watermark.%i.log.gz</fileNamePattern>
            <minIndex>1</minIndex>
            <maxIndex>10</maxIndex>
        </rollingPolicy>
        <triggeringPolicy class="ch.qos.logback.core.rolling.SizeBasedTriggeringPolicy">
            <maxFileSize>128MB</maxFileSize>
        </triggeringPolicy>
        <encoder>
            <pattern>%d{yyy-MM-dd HH:mm:ss,GMT+8}%m%n</pattern>
            <charset class="java.nio.charset.Charset">UTF-8</charset>
        </encoder>
    </appender>
    <appender name="RocketmqProxyWatermarkAppender" class="ch.qos.logback.classic.AsyncAppender">
        <appender-ref ref="RocketmqProxyWatermarkAppender_inner"/>
    </appender>

    <!-- Below is the logger configuration for broker-->
    <appender name="DefaultAppender"
              class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}broker_default.log</file>
        <append>true</append>
        <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
            <fileNamePattern>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}otherdays${fileSeparator}broker_default.%i.log.gz</fileNamePattern>
            <minIndex>1</minIndex>
            <maxIndex>10</maxIndex>
        </rollingPolicy>
        <triggeringPolicy class="ch.qos.logback.core.rolling.SizeBasedTriggeringPolicy">
            <maxFileSize>100MB</maxFileSize>
        </triggeringPolicy>
        <encoder>
            <pattern>%d{yyy-MM-dd HH:mm:ss,GMT+8} %p %t - %m%n</pattern>
            <charset class="java.nio.charset.Charset">UTF-8</charset>
        </encoder>
    </appender>

    <appender name="RocketmqBrokerAppender_inner"
              class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}broker.log</file>
        <append>true</append>
        <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
            <fileNamePattern>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}otherdays${fileSeparator}broker.%i.log.gz</fileNamePattern>
            <minIndex>1</minIndex>
            <maxIndex>20</maxIndex>
        </rollingPolicy>
        <triggeringPolicy class="ch.qos.logback.core.rolling.SizeBasedTriggeringPolicy">
            <maxFileSize>128MB</maxFileSize>
        </triggeringPolicy>
        <encoder>
            <pattern>%d{yyy-MM-dd HH:mm:ss,GMT+8} %p %t - %m%n</pattern>
            <charset class="java.nio.charset.Charset">UTF-8</charset>
        </encoder>
    </appender>
    <appender name="RocketmqBrokerAppender" class="ch.qos.logback.classic.AsyncAppender">
        <appender-ref ref="RocketmqBrokerAppender_inner"/>
    </appender>

    <appender name="RocketmqProtectionAppender_inner"
              class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}protection.log</file>
        <append>true</append>
        <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
            <fileNamePattern>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}otherdays${fileSeparator}protection.%i.log.gz</fileNamePattern>
            <minIndex>1</minIndex>
            <maxIndex>10</maxIndex>
        </rollingPolicy>
        <triggeringPolicy class="ch.qos.logback.core.rolling.SizeBasedTriggeringPolicy">
            <maxFileSize>100MB</maxFileSize>
        </triggeringPolicy>
        <encoder>
            <pattern>%d{yyy-MM-dd HH:mm:ss,GMT+8} - %m%n</pattern>
            <charset class="java.nio.charset.Charset">UTF-8</charset>
        </encoder>
    </appender>
    <appender name="RocketmqProtectionAppender" class="ch.qos.logback.classic.AsyncAppender">
        <appender-ref ref="RocketmqProtectionAppender_inner"/>
    </appender>

    <appender name="RocketmqWaterMarkAppender_inner"
              class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}watermark.log</file>
        <append>true</append>
        <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
            <fileNamePattern>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}otherdays${fileSeparator}watermark.%i.log.gz</fileNamePattern>
            <minIndex>1</minIndex>
            <maxIndex>10</maxIndex>
        </rollingPolicy>
        <triggeringPolicy class="ch.qos.logback.core.rolling.SizeBasedTriggeringPolicy">
            <maxFileSize>100MB</maxFileSize>
        </triggeringPolicy>
        <encoder>
            <pattern>%d{yyy-MM-dd HH:mm:ss,GMT+8} - %m%n</pattern>
            <charset class="java.nio.charset.Charset">UTF-8</charset>
        </encoder>
    </appender>
    <appender name="RocketmqWaterMarkAppender" class="ch.qos.logback.classic.AsyncAppender">
        <appender-ref ref="RocketmqWaterMarkAppender_inner"/>
    </appender>

    <appender name="RocketmqStoreAppender_inner"
              class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}store.log</file>
        <append>true</append>
        <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
            <fileNamePattern>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}otherdays${fileSeparator}store.%i.log.gz</fileNamePattern>
            <minIndex>1</minIndex>
            <maxIndex>10</maxIndex>
        </rollingPolicy>
        <triggeringPolicy class="ch.qos.logback.core.rolling.SizeBasedTriggeringPolicy">
            <maxFileSize>128MB</maxFileSize>
        </triggeringPolicy>
        <encoder>
            <pattern>%d{yyy-MM-dd HH:mm:ss,GMT+8} %p %t - %m%n</pattern>
            <charset class="java.nio.charset.Charset">UTF-8</charset>
        </encoder>
    </appender>
    <appender name="RocketmqStoreAppender" class="ch.qos.logback.classic.AsyncAppender">
        <appender-ref ref="RocketmqStoreAppender_inner"/>
    </appender>

    <appender name="RocketmqRemotingAppender_inner"
              class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}remoting.log</file>
        <append>true</append>
        <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
            <fileNamePattern>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}otherdays${fileSeparator}remoting.%i.log.gz</fileNamePattern>
            <minIndex>1</minIndex>
            <maxIndex>10</maxIndex>
        </rollingPolicy>
        <triggeringPolicy class="ch.qos.logback.core.rolling.SizeBasedTriggeringPolicy">
            <maxFileSize>100MB</maxFileSize>
        </triggeringPolicy>
        <encoder>
            <pattern>%d{yyy-MM-dd HH:mm:ss,GMT+8} %p %t - %m%n</pattern>
            <charset class="java.nio.charset.Charset">UTF-8</charset>
        </encoder>
    </appender>
    <appender name="RocketmqRemotingAppender" class="ch.qos.logback.classic.AsyncAppender">
        <appender-ref ref="RocketmqRemotingAppender_inner"/>
    </appender>

    <appender name="RocketmqStoreErrorAppender_inner"
              class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}storeerror.log</file>
        <append>true</append>
        <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
            <fileNamePattern>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}otherdays${fileSeparator}storeerror.%i.log.gz</fileNamePattern>
            <minIndex>1</minIndex>
            <maxIndex>10</maxIndex>
        </rollingPolicy>
        <triggeringPolicy class="ch.qos.logback.core.rolling.SizeBasedTriggeringPolicy">
            <maxFileSize>100MB</maxFileSize>
        </triggeringPolicy>
        <encoder>
            <pattern>%d{yyy-MM-dd HH:mm:ss,GMT+8} %p %t - %m%n</pattern>
            <charset class="java.nio.charset.Charset">UTF-8</charset>
        </encoder>
    </appender>
    <appender name="RocketmqStoreErrorAppender" class="ch.qos.logback.classic.AsyncAppender">
        <appender-ref ref="RocketmqStoreErrorAppender_inner"/>
    </appender>


    <appender name="RocketmqTransactionAppender_inner"
              class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}transaction.log</file>
        <append>true</append>
        <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
            <fileNamePattern>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}otherdays${fileSeparator}transaction.%i.log.gz</fileNamePattern>
            <minIndex>1</minIndex>
            <maxIndex>10</maxIndex>
        </rollingPolicy>
        <triggeringPolicy class="ch.qos.logback.core.rolling.SizeBasedTriggeringPolicy">
            <maxFileSize>100MB</maxFileSize>
        </triggeringPolicy>
        <encoder>
            <pattern>%d{yyy-MM-dd HH:mm:ss,GMT+8} %p %t - %m%n</pattern>
            <charset class="java.nio.charset.Charset">UTF-8</charset>
        </encoder>
    </appender>
    <appender name="RocketmqTransactionAppender" class="ch.qos.logback.classic.AsyncAppender">
        <appender-ref ref="RocketmqTransactionAppender_inner"/>
    </appender>

    <appender name="RocketmqRebalanceLockAppender_inner"
              class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}lock.log</file>
        <append>true</append>
        <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
            <fileNamePattern>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}otherdays${fileSeparator}lock.%i.log.gz</fileNamePattern>
            <minIndex>1</minIndex>
            <maxIndex>5</maxIndex>
        </rollingPolicy>
        <triggeringPolicy class="ch.qos.logback.core.rolling.SizeBasedTriggeringPolicy">
            <maxFileSize>100MB</maxFileSize>
        </triggeringPolicy>
        <encoder>
            <pattern>%d{yyy-MM-dd HH:mm:ss,GMT+8} %p %t - %m%n</pattern>
            <charset class="java.nio.charset.Charset">UTF-8</charset>
        </encoder>
    </appender>
    <appender name="RocketmqRebalanceLockAppender" class="ch.qos.logback.classic.AsyncAppender">
        <appender-ref ref="RocketmqRebalanceLockAppender_inner"/>
    </appender>

    <appender name="RocketmqFilterAppender_inner"
              class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}filter.log</file>
        <append>true</append>
        <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
            <fileNamePattern>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}otherdays${fileSeparator}filter.%i.log.gz</fileNamePattern>
            <minIndex>1</minIndex>
            <maxIndex>10</maxIndex>
        </rollingPolicy>
        <triggeringPolicy class="ch.qos.logback.core.rolling.SizeBasedTriggeringPolicy">
            <maxFileSize>100MB</maxFileSize>
        </triggeringPolicy>
        <encoder>
            <pattern>%d{yyy-MM-dd HH:mm:ss,GMT+8} %p %t - %m%n</pattern>
            <charset class="java.nio.charset.Charset">UTF-8</charset>
        </encoder>
    </appender>
    <appender name="RocketmqFilterAppender" class="ch.qos.logback.classic.AsyncAppender">
        <appender-ref ref="RocketmqFilterAppender_inner"/>
    </appender>

    <appender name="RocketmqStatsAppender"
              class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}stats.log</file>
        <append>true</append>
        <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
            <fileNamePattern>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}otherdays${fileSeparator}stats.%i.log.gz</fileNamePattern>
            <minIndex>1</minIndex>
            <maxIndex>5</maxIndex>
        </rollingPolicy>
        <triggeringPolicy class="ch.qos.logback.core.rolling.SizeBasedTriggeringPolicy">
            <maxFileSize>100MB</maxFileSize>
        </triggeringPolicy>
        <encoder>
            <pattern>%d{yyy-MM-dd HH:mm:ss,GMT+8} %p - %m%n</pattern>
            <charset class="java.nio.charset.Charset">UTF-8</charset>
        </encoder>
    </appender>

    <appender name="RocketmqCommercialAppender"
              class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}commercial.log</file>
        <append>true</append>
        <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
            <fileNamePattern>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}otherdays${fileSeparator}commercial.%i.log.gz</fileNamePattern>
            <minIndex>1</minIndex>
            <maxIndex>10</maxIndex>
        </rollingPolicy>
        <triggeringPolicy class="ch.qos.logback.core.rolling.SizeBasedTriggeringPolicy">
            <maxFileSize>500MB</maxFileSize>
        </triggeringPolicy>
        <encoder>
            <pattern>%d{yyy-MM-dd HH:mm:ss,GMT+8} %p - %m%n</pattern>
            <charset class="java.nio.charset.Charset">UTF-8</charset>
        </encoder>
    </appender>

    <appender name="RocketmqPopAppender_inner"
              class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}pop.log</file>
        <append>true</append>
        <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
            <fileNamePattern>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}otherdays${fileSeparator}pop.%i.log
            </fileNamePattern>
            <minIndex>1</minIndex>
            <maxIndex>20</maxIndex>
        </rollingPolicy>
        <triggeringPolicy
            class="ch.qos.logback.core.rolling.SizeBasedTriggeringPolicy">
            <maxFileSize>128MB</maxFileSize>
        </triggeringPolicy>
        <encoder>
            <pattern>%d{yyy-MM-dd HH:mm:ss,GMT+8} %p %t - %m%n</pattern>
            <charset class="java.nio.charset.Charset">UTF-8</charset>
        </encoder>
    </appender>

    <appender name="RocketmqProxyMetricsAppender"
              class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}proxy_metric.log</file>
        <append>true</append>
        <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
            <fileNamePattern>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}otherdays${fileSeparator}proxy_metric.%i.log.gz</fileNamePattern>
            <minIndex>1</minIndex>
            <maxIndex>10</maxIndex>
        </rollingPolicy>
        <triggeringPolicy class="ch.qos.logback.core.rolling.SizeBasedTriggeringPolicy">
            <maxFileSize>500MB</maxFileSize>
        </triggeringPolicy>
        <encoder>
            <pattern>%d{yyy-MM-dd HH:mm:ss,GMT+8} %p - %m%n</pattern>
            <charset class="java.nio.charset.Charset">UTF-8</charset>
        </encoder>
    </appender>

    <appender name="RocketmqPopAppender" class="ch.qos.logback.classic.AsyncAppender">
        <appender-ref ref="RocketmqPopAppender_inner"/>
    </appender>

    <appender name="STDOUT" class="ch.qos.logback.core.ConsoleAppender">
        <encoder>
            <pattern>%d{yyy-MM-dd HH:mm:ss,GMT+8} %p %t - %m%n</pattern>
            <charset class="java.nio.charset.Charset">UTF-8</charset>
        </encoder>
    </appender>

    <logger name="RocketmqBroker" additivity="false" level="INFO">
        <appender-ref ref="RocketmqBrokerAppender"/>
    </logger>

    <logger name="RocketmqProtection" additivity="false" level="INFO">
        <appender-ref ref="RocketmqProtectionAppender"/>
    </logger>

    <logger name="RocketmqWaterMark" additivity="false" level="INFO">
        <appender-ref ref="RocketmqWaterMarkAppender"/>
    </logger>

    <logger name="RocketmqCommon" additivity="false" level="INFO">
        <appender-ref ref="RocketmqBrokerAppender"/>
    </logger>

    <logger name="RocketmqStore" additivity="false" level="INFO">
        <appender-ref ref="RocketmqStoreAppender"/>
    </logger>

    <logger name="RocketmqStoreError" additivity="false" level="INFO">
        <appender-ref ref="RocketmqStoreErrorAppender"/>
    </logger>

    <logger name="RocketmqTransaction" additivity="false" level="INFO">
        <appender-ref ref="RocketmqTransactionAppender"/>
    </logger>

    <logger name="RocketmqRebalanceLock" additivity="false" level="INFO">
        <appender-ref ref="RocketmqRebalanceLockAppender"/>
    </logger>

    <logger name="RocketmqRemoting" additivity="false" level="INFO">
        <appender-ref ref="RocketmqRemotingAppender"/>
    </logger>

    <logger name="RocketmqStats" additivity="false" level="INFO">
        <appender-ref ref="RocketmqStatsAppender"/>
    </logger>

    <logger name="RocketmqCommercial" additivity="false" level="INFO">
        <appender-ref ref="RocketmqCommercialAppender"/>
    </logger>

    <logger name="RocketmqFilter" additivity="false" level="INFO">
        <appender-ref ref="RocketmqFilterAppender"/>
    </logger>

    <logger name="RocketmqConsole" additivity="false" level="INFO">
        <appender-ref ref="STDOUT"/>
    </logger>

    <logger name="RocketmqPop" additivity="false" level="INFO">
        <appender-ref ref="RocketmqPopAppender" />
    </logger>

    <logger name="RocketmqProxy" additivity="false" level="INFO">
        <appender-ref ref="RocketmqProxyAppender" />
    </logger>

    <logger name="RocketmqProxyWatermark" additivity="false" level="INFO">
        <appender-ref ref="RocketmqProxyWatermarkAppender" />
    </logger>

    <logger name="io.opentelemetry.exporter.logging.LoggingMetricExporter" additivity="false" level="INFO">
        <appender-ref ref="RocketmqProxyMetricsAppender" />
    </logger>

    <root level="INFO">
        <appender-ref ref="DefaultAppender"/>
    </root>
</configuration>
