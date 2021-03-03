/*
 *  Copyright 2020 Xiaomi
 *
 *    Licensed under the Apache License, Version 2.0 (the "License");
 *    you may not use this file except in compliance with the License.
 *    You may obtain a copy of the License at
 *
 *        http://www.apache.org/licenses/LICENSE-2.0
 *
 *    Unless required by applicable law or agreed to in writing, software
 *    distributed under the License is distributed on an "AS IS" BASIS,
 *    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *    See the License for the specific language governing permissions and
 *    limitations under the License.
 */

package com.xiaomi.youpin.quota.bo;

import lombok.Data;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * @author 
 */
@Data
public class RecordBo implements Serializable {

    private int id;

    private String ip;

    private long bizId;

    private List<ResourceBo> projectBefore;

    private List<ResourceBo> projectAfter;

    private Map<Long, BizResource> resourceBefore;

    private Map<Long, BizResource> resourceAfter;

    private String type;

    private long ctime;

    private int status;

    private String operator;
}
