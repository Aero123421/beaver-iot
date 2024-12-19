package com.milesight.beaveriot.rule.manager.service;

import com.milesight.beaveriot.rule.manager.repository.WorkflowRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class WorkflowLoader implements CommandLineRunner {
    @Autowired
    WorkflowService workflowService;

    @Override
    public void run(String... args) throws Exception {
        workflowService.loadActiveWorkflows();
    }
}
