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

<configuration>
    <appender name="STDOUT" class="ch.qos.logback.core.ConsoleAppender">
        <encoder charset="UTF-8">
            <pattern>[%d{yyyy-MM-dd HH:mm:ss.SSS}] %5p %m%n</pattern>
        </encoder>
    </appender>
    <appender name="CustomConsoleAppender" class="io.github.aliyunmq.logback.extensions.CustomConsoleAppender">
        <encoder>
            <pattern>%yellow(%d{yyy-MM-dd HH:mm:ss.SSS,GMT+8}) %highlight(%-5p) %boldWhite([%pid]) %magenta([%t]) %boldGreen([%logger{12}#%M:%L]) - %m%n
            </pattern>
            <charset class="java.nio.charset.Charset">UTF-8</charset>
        </encoder>
    </appender>
    <appender name="DefaultAppenderInner" class="ch.qos.logback.core.rolling.RollingFileAppender">
        <append>true</append>
        <File>
            ${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}rocketmq_client.log
        </File>
        <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
            <FileNamePattern>
                ${logRootDir}${fileSeparator}logs${fileSeparator}rocketmqlogs${fileSeparator}other_days${fileSeparator}rocketmq_client-%i.log.gz
            </FileNamePattern>
            <minIndex>1</minIndex>
            <maxIndex>-10</maxIndex>
        </rollingPolicy>
        <triggeringPolicy class="ch.qos.logback.core.rolling.SizeBasedTriggeringPolicy">
            <maxFileSize>64MB</maxFileSize>
        </triggeringPolicy>
        <encoder class="ch.qos.logback.classic.encoder.PatternLayoutEncoder">
            <pattern>%d{yyy-MM-dd HH:mm:ss.SSS,GMT+8} %-5p [%pid] [%t] [%logger{12}#%M:%L] - %m%n</pattern>
            <charset class="java.nio.charset.Charset">UTF-8</charset>
        </encoder>
    </appender>
    <appender name="DefaultAppender" class="ch.qos.logback.classic.AsyncAppender">
        <appender-ref ref="DefaultAppenderInner"/>
    </appender>
    <root level="INFO">
        <appender-ref ref="STDOUT" />
        <appender-ref ref="CustomConsoleAppender"/>
        <appender-ref ref="DefaultAppender" additivity="false"/>
    </root>
    <!-- ref: https://github.com/grpc/grpc-java/issues/3033 -->
    <!-- <logger name="io.grpc" level="warn"/> -->
</configuration>
