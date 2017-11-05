# Copyright (C) 2017 PornAOSP Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# -----------------------------------------------------------------
# PornAOSP OTA update package

PAOSP_PACKAGE := $(PAOSP_VERSION)-$(TARGET_DEVICE).zip
PAOSP_TARGET_PACKAGE := $(PRODUCT_OUT)/$(PAOSP_PACKAGE)

.PHONY: bacon
bacon: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ./vendor/paosp/build/tools/ota
	$(hide) rm -rf $(PRODUCT_OUT)/PornAOSP*
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(PAOSP_TARGET_PACKAGE)
	$(hide) $(MD5SUM) $(PAOSP_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(PAOSP_TARGET_PACKAGE).md5sum
	$(hide) rm -rf $(INTERNAL_OTA_PACKAGE_TARGET)
	@echo "$(PAOSP_TARGET_PACKAGE)"
	@echo -e "\a\n================-Package complete-================"
	@echo "file: $(PAOSP_PACKAGE)"
	@echo "md5: $(shell cat $(PAOSP_TARGET_PACKAGE).md5sum | awk '{ print $$1 }')"
	@echo "size: $(shell ls -lah $(PAOSP_TARGET_PACKAGE) | awk '{ print $$5 }')"
	@echo -e "==================================================\n"
	$(hide) jack-admin stop-server
