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
    <appender name="DefaultAppender"
              class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}namesrv_default.log</file>
        <append>true</append>
        <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
            <fileNamePattern>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}otherdays${fileSeparator}namesrv_default.%i.log.gz</fileNamePattern>
            <minIndex>1</minIndex>
            <maxIndex>5</maxIndex>
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

    <appender name="RocketmqNamesrvAppender_inner"
              class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}namesrv.log</file>
        <append>true</append>
        <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
            <fileNamePattern>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}otherdays${fileSeparator}namesrv.%i.log.gz</fileNamePattern>
            <minIndex>1</minIndex>
            <maxIndex>5</maxIndex>
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
    <appender name="RocketmqNamesrvAppender" class="ch.qos.logback.classic.AsyncAppender">
        <appender-ref ref="RocketmqNamesrvAppender_inner"/>
        <discardingThreshold>0</discardingThreshold>
    </appender>

    <appender name="RocketmqTrafficAppender_inner"
              class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}namesrv_traffic.log</file>
        <append>true</append>
        <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
            <fileNamePattern>${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}otherdays${fileSeparator}namesrv_traffic.%i.log.gz</fileNamePattern>
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
    <appender name="RocketmqTrafficAppender" class="ch.qos.logback.classic.AsyncAppender">
        <appender-ref ref="RocketmqTrafficAppender_inner"/>
    </appender>

    <appender name="STDOUT" class="ch.qos.logback.core.ConsoleAppender">
        <encoder>
            <pattern>%d{yyy-MM-dd HH:mm:ss,GMT+8} %p %t - %m%n</pattern>
            <charset class="java.nio.charset.Charset">UTF-8</charset>
        </encoder>
    </appender>

    <logger name="RocketmqNamesrv" additivity="false" level="INFO">
        <appender-ref ref="RocketmqNamesrvAppender"/>
    </logger>

    <logger name="RocketmqCommon" additivity="false" level="INFO">
        <appender-ref ref="RocketmqNamesrvAppender"/>
    </logger>

    <logger name="RocketmqRemoting" additivity="false" level="INFO">
        <appender-ref ref="RocketmqNamesrvAppender"/>
    </logger>

    <logger name="RocketmqNamesrvConsole" additivity="false" level="INFO">
        <appender-ref ref="STDOUT"/>
    </logger>

    <logger name="RocketmqController" additivity="false" level="INFO">
        <appender-ref ref="RocketmqNamesrvAppender"/>
    </logger>

    <logger name="RocketmqTraffic" additivity="false" level="INFO">
        <appender-ref ref="RocketmqTrafficAppender" />
    </logger>

    <root level="INFO">
        <appender-ref ref="DefaultAppender"/>
    </root>
</configuration>
