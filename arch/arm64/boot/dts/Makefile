# SPDX-License-Identifier: GPL-2.0

ifdef CONFIG_SEC_M31_PROJECT
dtb-y += exynos/exynos9610.dtb
dtbo-y += samsung/exynos9611-m31_eur_open_00.dtbo
endif

targets += dtbs
DTB_LIST  := $(dtb-y) $(dtbo-y)
always    := $(DTB_LIST)

dtbs: $(addprefix $(obj)/, $(DTB_LIST))

clean-files := *.dtb*
