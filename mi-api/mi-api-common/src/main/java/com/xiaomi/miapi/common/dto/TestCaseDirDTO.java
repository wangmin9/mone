package com.xiaomi.miapi.common.dto;

import lombok.Data;

@Data
public class TestCaseDirDTO {

    private String username;

    private String name;

    private Integer projectId;

    private Integer apiId;

    private Boolean globalCase;
}
