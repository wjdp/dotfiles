# -*- coding: utf-8 -*-
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
#
# Works around sudo-rs wrapping custom -p prompts as "[sudo: <prompt>] Password:",
# which defeats the prompt matching in ansible's builtin sudo become plugin and
# hangs every become task until it times out.
#
# check_password_prompt below is taken verbatim from ansible devel:
# https://github.com/ansible/ansible/pull/86175 — merged to devel, reverted from
# the stable branches over i18n, replacement #86964 still in draft. Drop this
# plugin and the become_method in ansible.cfg once a stable ansible-core ships it.
#
# DOCUMENTATION is the builtin sudo plugin's, with the name changed; become
# plugins source their options from it, so it has to stay parseable.
from __future__ import annotations

DOCUMENTATION = """
    name: sudors
    short_description: Substitute User DO, tolerating sudo-rs password prompts
    description:
        - This become plugin allows your remote/login user to execute commands as another user via the sudo utility.
        - Behaves as the builtin C(sudo) plugin, but also matches the password prompt emitted by C(sudo-rs).
    author: ansible (@core)
    options:
        become_user:
            description: User you 'become' to execute the task
            default: root
            ini:
              - section: privilege_escalation
                key: become_user
              - section: sudo_become_plugin
                key: user
            vars:
              - name: ansible_become_user
              - name: ansible_sudo_user
            env:
              - name: ANSIBLE_BECOME_USER
              - name: ANSIBLE_SUDO_USER
            keyword:
              - name: become_user
        become_exe:
            description: Sudo executable
            default: sudo
            ini:
              - section: privilege_escalation
                key: become_exe
              - section: sudo_become_plugin
                key: executable
            vars:
              - name: ansible_become_exe
              - name: ansible_sudo_exe
            env:
              - name: ANSIBLE_BECOME_EXE
              - name: ANSIBLE_SUDO_EXE
            keyword:
              - name: become_exe
        become_flags:
            description: Options to pass to sudo
            default: -H -S -n
            ini:
              - section: privilege_escalation
                key: become_flags
              - section: sudo_become_plugin
                key: flags
            vars:
              - name: ansible_become_flags
              - name: ansible_sudo_flags
            env:
              - name: ANSIBLE_BECOME_FLAGS
              - name: ANSIBLE_SUDO_FLAGS
            keyword:
              - name: become_flags
        become_pass:
            description: Password to pass to sudo
            required: False
            vars:
              - name: ansible_become_password
              - name: ansible_become_pass
              - name: ansible_sudo_pass
            env:
              - name: ANSIBLE_BECOME_PASS
              - name: ANSIBLE_SUDO_PASS
            ini:
              - section: sudo_become_plugin
                key: password
        sudo_chdir:
            description: Directory to change to before invoking sudo; can avoid permission errors when dropping privileges.
            type: string
            required: False
            vars:
              - name: ansible_sudo_chdir
            env:
              - name: ANSIBLE_SUDO_CHDIR
            ini:
              - section: sudo_become_plugin
                key: chdir
"""

from ansible.plugins.become.sudo import BecomeModule as SudoBecomeModule


class BecomeModule(SudoBecomeModule):

    name = 'sudors'

    def check_password_prompt(self, b_output):
        matched = super().check_password_prompt(b_output)
        if not matched:
            # might be using sudo-rs, which is not backwards compatible
            prompt = self.prompt
            self.prompt = f"[sudo: {prompt}] Password:"
            matched = super().check_password_prompt(b_output)
            self.prompt = prompt
        return matched
