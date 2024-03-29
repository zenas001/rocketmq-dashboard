/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.apache.rocketmq.dashboard;

import freemarker.template.TemplateException;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.client.log.ClientLogger;
import org.apache.rocketmq.dashboard.task.CmdExecTask;
import org.apache.rocketmq.dashboard.util.AppUtil;
import org.apache.rocketmq.dashboard.util.TemplateGenerateTools;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.EnableMBeanExport;
import org.springframework.jmx.support.RegistrationPolicy;
import org.springframework.scheduling.annotation.EnableScheduling;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@SpringBootApplication
@EnableScheduling
@ServletComponentScan
@EnableMBeanExport(registration = RegistrationPolicy.IGNORE_EXISTING)
public class App {


    /**
     * url
     */
    private static final String URL = "url";
    /**
     * rocketMq.home
     */
    private static final String ROCKET_MQ_HOME = "rocketMq.home";
    /**
     * browser.path
     */
    public static final String BROWSER_PATH = "browser.path";
    /**
     * play.cmd
     */
    private static final String STARTUP_SCRIPT = "startup.script";
    /**
     * shutdown.cmd
     */
    private static final String SHUTDOWN_SCRIPT = "shutdown.script";

    /**
     * log.root.dir
     */
    private static final String LOG_ROOT_DIR = "logRootDir";

    /**
     * log name
     * rmq.console.logback 不动态生成，注掉
     */
    private static final String[] LOG_BACK_XML_ARRAY = {/*"rmq.console.logback" ,*/ "rmq.broker.logback" , "rmq.client.logback" , "rmq.controller" +
            ".logback" , "rmq" +
            ".namesrv.logback"
            , "rmq.proxy.logback" , "rmq.tools.logback"};
    /**
     * log template suffix
     */
    private static final String LOG_BACK_XML_FTL_SUFFIX = ".ftl";
    /**
     * ROCKETMQ HOME/bin
     */
    private static final String CMD_PATH = "bin";

    /**
     * ROCKETMQ HOME/config
     */
    private static final String CONFIG_PATH = "conf";


    public static void main(String[] args) throws InterruptedException, TemplateException, IOException {
        Map<String, String> argsMap = AppUtil.toBootArgs(args);
        //rocketMq home目录
        String rocketMqHome = argsMap.get(ROCKET_MQ_HOME);
        //日志root 目录
        String logRootDir = argsMap.get(LOG_ROOT_DIR);
        generateLogConfigXml(logRootDir, rocketMqHome);
        //休1.5s
        Thread.sleep(1500);
        String startCmd = String.join(File.separator, rocketMqHome, CMD_PATH, argsMap.get(STARTUP_SCRIPT));
        //启动之前启动nameserv和 broker
        new CmdExecTask(startCmd).start();
        //注冊shutdownHook    /*中断应用时shutdown Mq Server*/
        String shutdownCmd = String.join(File.separator, rocketMqHome, CMD_PATH, argsMap.get(SHUTDOWN_SCRIPT));
        Runtime.getRuntime().addShutdownHook(new CmdExecTask(shutdownCmd));
        //游览器地址
        String browserPath = argsMap.get(BROWSER_PATH);
        if (browserPath != null) {
            File browser = new File(browserPath);
            if (browser.exists()) {
                //启动游览器打开dashboard地址
                //dashboard访问地址
                String url = argsMap.get(URL);
                String startBrowserCmd = String.join(" " , browser.getPath(), url);
                //启动游览器
                new CmdExecTask(startBrowserCmd).start();
            }
        }
        //休1.5s
        Thread.sleep(1500);
        SpringApplication.run(App.class, args);
    }

    private static void generateLogConfigXml(String logRootDir, String rocketMqHome) throws IOException, TemplateException {
        //根据日志模板文件生成MQServer 日志配置xml文件
        if (logRootDir != null) {
            Map<String, String> env = new HashMap<>();
            env.put(LOG_ROOT_DIR, logRootDir);
            env.put("fileSeparator" , File.separator);
            log.info("generate RocketMq log config xml file to :\n");
            for (String template : LOG_BACK_XML_ARRAY) {
                String outPath = template.equals("rmq.console.logback") ? new File("src/main/resources").getAbsolutePath() :
                        rocketMqHome + CONFIG_PATH;
                //输出日志配置xml本地路径
                String logXmlLocation = TemplateGenerateTools.generateImportTemplate(env, template.concat(LOG_BACK_XML_FTL_SUFFIX), outPath,
                        template);
                log.info("{}\n" , logXmlLocation);
                if (template.equals("rmq.client.logback")) {
                    System.setProperty(ClientLogger.CLIENT_LOG_ROOT, env.get(LOG_ROOT_DIR));
                }
            }
        }
    }

}
