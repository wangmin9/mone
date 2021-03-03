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

package com.xiaomi.youpin.codecheck.code.impl.concurrent;

import com.sun.source.tree.BlockTree;
import com.sun.source.tree.MethodTree;
import com.xiaomi.youpin.codecheck.code.impl.MethodCheck;
import com.xiaomi.youpin.codecheck.po.CheckResult;
import org.apache.commons.lang3.tuple.Pair;

public class LockMustUnlockInFinal extends MethodCheck {

    @Override
    public Pair<Integer, CheckResult> _check(MethodTree methodTree) {
        BlockTree body = methodTree.getBody();
        if (body == null) {
            return Pair.of(CheckResult.INFO, CheckResult.getInfoRes("", "", ""));
        }



        return Pair.of(CheckResult.INFO, CheckResult.getInfoRes("", "", ""));
    }
}
