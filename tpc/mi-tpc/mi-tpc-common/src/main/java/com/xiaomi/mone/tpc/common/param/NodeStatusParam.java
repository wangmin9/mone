package com.xiaomi.mone.tpc.common.param;

import com.xiaomi.mone.tpc.common.enums.NodeStatusEnum;
import lombok.Data;
import lombok.ToString;

/**
 * @project: mi-tpc
 * @author: zgf1
 * @date: 2022/3/3 19:52
 */
@Data
@ToString(callSuper = true)
public class NodeStatusParam extends BaseParam {

    private Long id;
    private Integer status;

    @Override
    public boolean argCheck() {
        if (id == null) {
            return false;
        }
        if (status == null || NodeStatusEnum.getEnum(status) == null) {
            return false;
        }
        return true;
    }
}