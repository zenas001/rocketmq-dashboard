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

    <appender name="DefaultAppender" class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}broker_default.log</file>
        <append>true</append>
        <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
            <fileNamePattern>
                ${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}otherdays${fileSeparator}broker_default.%i.log.gz
            </fileNamePattern>
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
    <appender name="DefaultAsyncAppender" class="ch.qos.logback.classic.AsyncAppender">
        <appender-ref ref="DefaultAppender"/>
    </appender>
    <appender name="RocketmqBrokerAppender"
              class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}broker.log</file>
        <append>true</append>
        <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
            <fileNamePattern>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}otherdays${fileSeparator}
                broker.%i.log.gz
            </fileNamePattern>
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
    <appender name="RocketmqBrokerAsyncAppender" class="ch.qos.logback.classic.AsyncAppender">
        <appender-ref ref="RocketmqBrokerAppender"/>
    </appender>
    <appender name="RocketmqProtectionAppender"
              class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>
            ${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}protection.log
        </file>
        <append>true</append>
        <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
            <fileNamePattern>
                ${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}otherdays${fileSeparator}protection.%i.log.gz
            </fileNamePattern>
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
    <appender name="RocketmqProtectionAsyncAppender" class="ch.qos.logback.classic.AsyncAppender">
        <appender-ref ref="RocketmqProtectionAppender"/>
    </appender>
    <appender name="RocketmqWaterMarkAppender"
              class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>
            ${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}watermark.log
        </file>
        <append>true</append>
        <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
            <fileNamePattern>
                ${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}otherdays${fileSeparator}watermark.%i.log.gz
            </fileNamePattern>
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
    <appender name="RocketmqWaterMarkAsyncAppender" class="ch.qos.logback.classic.AsyncAppender">
        <appender-ref ref="RocketmqWaterMarkAppender"/>
    </appender>
    <appender name="RocketmqStoreAppender"
              class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>
            ${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}store.log
        </file>
        <append>true</append>
        <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
            <fileNamePattern>
                ${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}otherdays${fileSeparator}store.%i.log.gz
            </fileNamePattern>
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
    <appender name="RocketmqStoreAsyncAppender" class="ch.qos.logback.classic.AsyncAppender">
        <appender-ref ref="RocketmqStoreAppender"/>
    </appender>
    <appender name="RocketmqTieredStoreAppender"
              class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>
            ${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}tiered_store.log
        </file>
        <append>true</append>
        <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
            <fileNamePattern>
                ${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}otherdays${fileSeparator}tiered_store.%i.log.gz
            </fileNamePattern>
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
    <appender name="RocketmqTieredStoreAsyncAppender" class="ch.qos.logback.classic.AsyncAppender">
        <appender-ref ref="RocketmqTieredStoreAppender"/>
    </appender>
    <appender name="RocketmqTrafficAppender"
              class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}broker_traffic.log</file>
        <append>true</append>
        <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
            <fileNamePattern>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}otherdays${fileSeparator}
                broker_traffic.%i.log.gz
            </fileNamePattern>
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
    <appender name="RocketmqTrafficAsyncAppender" class="ch.qos.logback.classic.AsyncAppender">
        <appender-ref ref="RocketmqTrafficAppender"/>
    </appender>
    <appender name="RocketmqRemotingAppender"
              class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>
            ${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}remoting.log
        </file>
        <append>true</append>
        <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
            <fileNamePattern>
                ${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}otherdays${fileSeparator}
                remoting.%i.log.gz
            </fileNamePattern>
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
    <appender name="RocketmqRemotingAsyncAppender" class="ch.qos.logback.classic.AsyncAppender">
        <appender-ref ref="RocketmqRemotingAppender"/>
    </appender>
    <appender name="RocketmqStoreErrorAppender"
              class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>
            ${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}storeerror.log
        </file>
        <append>true</append>
        <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
            <fileNamePattern>
                ${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}otherdays${fileSeparator}
                storeerror.%i.log.gz
            </fileNamePattern>
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
    <appender name="RocketmqStoreErrorAsyncAppender" class="ch.qos.logback.classic.AsyncAppender">
        <appender-ref ref="RocketmqStoreErrorAppender"/>
    </appender>
    <appender name="RocketmqTransactionAppender"
              class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>
            ${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}transaction.log
        </file>
        <append>true</append>
        <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
            <fileNamePattern>
                ${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}otherdays${fileSeparator}
                transaction.%i.log.gz
            </fileNamePattern>
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
    <appender name="RocketmqTransactionAsyncAppender" class="ch.qos.logback.classic.AsyncAppender">
        <appender-ref ref="RocketmqTransactionAppender"/>
    </appender>
    <appender name="RocketmqRebalanceLockAppender"
              class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>
            ${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}lock.log
        </file>
        <append>true</append>
        <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
            <fileNamePattern>
                ${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}otherdays${fileSeparator}
                lock.%i.log.gz
            </fileNamePattern>
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
    <appender name="RocketmqRebalanceLockAysncAppender" class="ch.qos.logback.classic.AsyncAppender">
        <appender-ref ref="RocketmqRebalanceLockAppender"/>
    </appender>
    <appender name="RocketmqFilterAppender"
              class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>
            ${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}filter.log
        </file>
        <append>true</append>
        <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
            <fileNamePattern>
                ${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}otherdays${fileSeparator}
                filter.%i.log.gz
            </fileNamePattern>
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
    <appender name="RocketmqRebalanceLockAysncAppender" class="ch.qos.logback.classic.AsyncAppender">
        <appender-ref ref="RocketmqFilterAppender"/>
    </appender>
    <appender name="RocketmqStatsAppender"
              class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>
            ${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}stats.log
        </file>
        <append>true</append>
        <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
            <fileNamePattern>
                ${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}otherdays${fileSeparator}
                stats.%i.log.gz
            </fileNamePattern>
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
    <appender name="RocketmqStatsAsyncAppender" class="ch.qos.logback.classic.AsyncAppender">
        <appender-ref ref="RocketmqStatsAppender"/>
    </appender>
    <appender name="RocketmqCommercialAppender"
              class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>
            ${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}commercial.log
        </file>
        <append>true</append>
        <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
            <fileNamePattern>
                ${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}otherdays${fileSeparator}
                commercial.%i.log.gz
            </fileNamePattern>
            <minIndex>1</minIndex>
            <maxIndex>10</maxIndex>
        </rollingPolicy>
        <triggeringPolicy class="ch.qos.logback.core.rolling.SizeBasedTriggeringPolicy">
            <maxFileSize>500MB</maxFileSize>
        </triggeringPolicy>
    </appender>
    <appender name="RocketmqCommercialAsyncAppender" class="ch.qos.logback.classic.AsyncAppender">
        <appender-ref ref="RocketmqCommercialAppender"/>
    </appender>
    <appender name="RocketmqPopAppender"
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
    <appender name="RocketmqPopAsyncAppender" class="ch.qos.logback.classic.AsyncAppender">
        <appender-ref ref="RocketmqPopAppender"/>
    </appender>
    <appender name="RocketmqColdCtrAppender"
              class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>${logRootDir}/logs/rocketmqlogs/coldctr.log</file>
        <append>true</append>
        <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
            <fileNamePattern>${logRootDir}/logs/rocketmqlogs/otherdays/coldctr.%i.log
            </fileNamePattern>
            <minIndex>1</minIndex>
            <maxIndex>10</maxIndex>
        </rollingPolicy>
        <triggeringPolicy
                class="ch.qos.logback.core.rolling.SizeBasedTriggeringPolicy">
            <maxFileSize>100MB</maxFileSize>
        </triggeringPolicy>
        <encoder>
            <pattern>%d{yyy-MM-dd HH:mm:ss,GMT+8} %p %t - %m%n</pattern>
            <charset class="java.nio.charset.Charset">UTF-8</charset>
        </encoder>
    </appender>
    <appender name="RocketmqColdCtrAsyncAppender" class="ch.qos.logback.classic.AsyncAppender">
        <appender-ref ref="RocketmqColdCtrAppender"/>
    </appender>
    <appender name="RocketmqCommercialAppender"
              class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>
            ${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}broker_metric.log
        </file>
        <append>true</append>
        <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
            <fileNamePattern>
                ${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}otherdays${fileSeparator}broker_metric.%i.log.gz
            </fileNamePattern>
            <minIndex>1</minIndex>
            <maxIndex>10</maxIndex>
        </rollingPolicy>
        <triggeringPolicy class="ch.qos.logback.core.rolling.SizeBasedTriggeringPolicy">
            <maxFileSize>500MB</maxFileSize>
        </triggeringPolicy>
        <encoder>
            <pattern>%d{yyy-MM-dd HH:mm:ss,GMT+8} %p %t - %m%n</pattern>
            <charset class="java.nio.charset.Charset">UTF-8</charset>
        </encoder>
    </appender>

    <appender name="STDOUT" class="ch.qos.logback.core.ConsoleAppender">
        <encoder>
            <pattern>%d{yyy-MM-dd HH:mm:ss,GMT+8} %p %t - %m%n</pattern>
            <charset class="java.nio.charset.Charset">UTF-8</charset>
        </encoder>
    </appender>

    <logger name="RocketmqBroker" additivity="false" level="INFO">
        <appender-ref ref="RocketmqBrokerAsyncAppender"/>
    </logger>

    <logger name="RocketmqProtection" additivity="false" level="INFO">
        <appender-ref ref="RocketmqProtectionAsyncAppender"/>
    </logger>

    <logger name="RocketmqWaterMark" additivity="false" level="INFO">
        <appender-ref ref="RocketmqWaterMarkAsyncAppender"/>
    </logger>

    <logger name="RocketmqCommon" additivity="false" level="INFO">
        <appender-ref ref="RocketmqBrokerAsyncAppender"/>
    </logger>

    <logger name="RocketmqStore" additivity="false" level="INFO">
        <appender-ref ref="RocketmqStoreAsyncAppender"/>
    </logger>

    <logger name="RocketmqStoreError" additivity="false" level="INFO">
        <appender-ref ref="RocketmqStoreErrorAsyncAppender"/>
    </logger>

    <logger name="RocketmqTieredStore" additivity="false" level="INFO">
        <appender-ref ref="RocketmqTieredStoreAsyncAppender"/>
    </logger>

    <logger name="RocketmqTransaction" additivity="false" level="INFO">
        <appender-ref ref="RocketmqTransactionAsyncAppender"/>
    </logger>

    <logger name="RocketmqRebalanceLock" additivity="false" level="INFO">
        <appender-ref ref="RocketmqRebalanceLockAysncAppender"/>
    </logger>

    <logger name="RocketmqRemoting" additivity="false" level="INFO">
        <appender-ref ref="RocketmqRemotingAsyncAppender"/>
    </logger>

    <logger name="RocketmqStats" additivity="false" level="INFO">
        <appender-ref ref="RocketmqStatsAsyncAppender"/>
    </logger>

    <logger name="RocketmqCommercial" additivity="false" level="INFO">
        <appender-ref ref="RocketmqCommercialAsyncAppender"/>
    </logger>

    <logger name="RocketmqFilter" additivity="false" level="INFO">
        <appender-ref ref="RocketmqFilterSiftingAppender"/>
    </logger>

    <logger name="RocketmqConsole" additivity="false" level="INFO">
        <appender-ref ref="STDOUT"/>
    </logger>

    <logger name="RocketmqPop" additivity="false" level="INFO">
        <appender-ref ref="RocketmqPopAsyncAppender"/>
    </logger>

    <logger name="RocketmqColdCtr" additivity="false">
        <level value="INFO"/>
        <appender-ref ref="RocketmqColdCtrAsyncAppender"/>
    </logger>

    <logger name="RocketmqTraffic" additivity="false" level="INFO">
        <appender-ref ref="RocketmqTrafficAsyncAppender"/>
    </logger>

    <logger name="io.opentelemetry.exporter.logging.LoggingMetricExporter" additivity="false" level="INFO">
        <appender-ref ref="RocketmqCommercialAppender"/>
    </logger>

    <root level="INFO">
        <appender-ref ref="DefaultAsyncAppender"/>
    </root>
</configuration>
