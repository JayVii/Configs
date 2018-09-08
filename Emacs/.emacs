;; Initialize packages
(setq package-enable-at-startup nil) (package-initialize)

;; EXWM
;(require 'exwm)
;(require 'exwm-config)
;(exwm-config-default)
;(setq exwm-workspace-number 10)
;(require 'exwm-systemtray)
;(exwm-systemtray-enable)

;(global-set-key (kbd "s-t") 'ansi-term)
;(global-set-key (kbd "s-e") '(lambda () (interactive) (shell-command "/home/jan/Develop/Passmenu/passmenu")))
;(global-set-key (kbd "s-r") '(lambda () (interactive) (shell-command "/home/jan/Develop/bin/twitch")))
;(global-set-key (kbd "s-a") '(lambda () (interactive) (shell-command "/home/jan/Develop/bin/contacts_vcard")))
;(global-set-key (kbd "s-l") '(lambda () (interactive) (shell-command "light-locker-command --lock")))
;(global-set-key (kbd "s-x s-l") '(lambda () (interactive) (shell-command "/home/jan/Develop/bin/screensaver.sh")))
;(global-set-key (kbd "s-x s-+") '(lambda () (interactive) (shell-command "xbacklight -dec 10%")))
;(global-set-key (kbd "s-x s--") '(lambda () (interactive) (shell-command "xbacklight -inc 10%")))
;(global-set-key (kbd "s--") '(lambda () (interactive) (shell-command "amixer -q set 'Master' 10%-")))
;(global-set-key (kbd "s-+") '(lambda () (interactive) (shell-command "amixer -q set 'Master' 10%+")))
;(global-set-key (kbd "s-m") '(lambda () (interactive) (shell-command "amixer -q set 'Master' toggle")))

;; Disable menubar
(menu-bar-mode -99)
(tool-bar-mode -99)
;(scroll-bar-mode -99)

;; Set font
(add-to-list 'default-frame-alist '(font . "DejaVuSansMono-10" ))
(set-face-attribute 'default t :font "DejaVuSansMono-10" )
(set-face-attribute 'default nil :font "DejaVuSansMono-10" )
(set-frame-font "DejaVuSansMono-10" nil t)

;; Auto-Complete
(require 'auto-complete-config)
(ac-config-default)

;; Switch Dictionary
(ispell-change-dictionary "english")
(defun fd-switch-dictionary()
  (interactive)
  (let* ((dic ispell-current-dictionary)
   (change (if (string= dic "deutsch") "english" "deutsch")))
    (ispell-change-dictionary change)
    (flyspell-buffer)
    (message "Dictionary switched from %s to %s" dic change)))
(global-set-key (kbd "C-x M-d")   'fd-switch-dictionary)

;; Spellcheck
;(dolist (hook '(text-mode-hook))
;  (add-hook hook (lambda () (flyspell-mode 1))
;  (add-hook hook (lambda () (flyspell-buffer)))))
(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
  (add-hook hook (lambda () (flyspell-mode -1))))
(defun flyspell-check-next-highlighted-word ()
  (interactive)
  (flyspell-goto-next-error)
  (ispell-word)
    )
(global-set-key (kbd "C-x C-n") 'flyspell-check-next-highlighted-word)
(global-set-key (kbd "C-x C-p") 'flyspell-check-previous-highlighted-word)

;; ESS and R
(add-hook 'ess-mode-hook (lambda () (local-set-key (kbd "M-RET") 'ess-eval-line-and-step)))

;; Folding
(vimish-fold-global-mode 1)
(global-set-key (kbd "C-x M-f") 'vimish-fold)
(global-set-key (kbd "C-f") 'vimish-fold-toggle)

;; melpa
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
(add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/"))))
(package-initialize)

;; load theme
(add-hook 'after-init-hook (lambda () (load-theme 'dracula t)))

;; FUNCTION fill with whitespace
(defun mode-line-fill (face reserve)
  "Return empty space using FACE and leaving RESERVE space on the right."
  (unless reserve
    (setq reserve 20))
  (when (and window-system (eq 'right (get-scroll-bar-mode)))
    (setq reserve (- reserve 3)))
  (propertize " "
        'display `((space :align-to (- (+ right right-fringe right-margin) ,reserve)))
                      'face face))

;; Mode Line
(setq-default mode-line-format
  (list
    ;; left
      ;; file type
      "[" 'mode-name "] "         
      ;; buffer name
      "%b"
      ;; modify status
      mode-line-modified " "
    ;; fill with whitespace
    (mode-line-fill 'mode-line 30)
    ;; right
      ;; Position
      "Line: %l Column: %c (%p)"))

;; Recently opened files
(recentf-mode 1)
 (setq-default recent-save-file "~/.emacs.d/recentf")  

;; Clipboard Copy-Paste
(defun my-copy-to-xclipboard(arg)
  (interactive "P")
  (cond
   ((not (use-region-p))
    (message "Nothing to yank to X-clipboard"))
   ((and (not (display-graphic-p))
   (/= 0 (shell-command-on-region
                     (region-beginning) (region-end) "xsel -i -b")))
          (error "Is program `xsel' installed?"))
        (t
          (when (display-graphic-p)
            (call-interactively 'clipboard-kill-ring-save))
          (message "Yanked region to X-clipboard")
          (when arg
            (kill-region  (region-beginning) (region-end)))
          (deactivate-mark))))

(defun my-cut-to-xclipboard()
  (interactive)
  (my-copy-to-xclipboard t))
    
(defun my-paste-from-xclipboard()
  (interactive)
  (if (display-graphic-p)
      (clipboard-yank)
      (let*
    ((opt (prefix-numeric-value current-prefix-arg))
          (opt (cond
           ((=  1 opt) "b")
           ((=  4 opt) "p")
           ((= 16 opt) "s"))))
        (insert (shell-command-to-string (concat "xsel -o -" opt))))))

(global-set-key (kbd "M-w") 'my-copy-to-xclipboard)
(global-set-key (kbd "C-y") 'my-paste-from-xclipboard)
(global-set-key (kbd "C-w") 'my-cut-to-xclipboard)

;; disable auto-indent
(electric-indent-mode 0)

; I hate tabs!
(setq-default indent-tabs-mode nil)

;; 80 column rule
; set highlight-column to 80
(setq-default column-enforce-column 80)

; enable for text (incl markdown, latex), ess
(add-hook 'after-init-hook
          (lambda ()
            (column-enforce-mode t)
            (turn-on-auto-fill)))
(add-hook 'text-mode-hook
          (lambda ()
            (column-enforce-mode t)
            (turn-on-auto-fill)))
(add-hook 'ess-mode-hook
          (lambda ()
            (column-enforce-mode t)
            (turn-on-auto-fill)))
(add-hook 'css-mode-hook
          (lambda ()
            (column-enforce-mode t)
            (turn-on-auto-fill)))
(add-hook 'html-mode-hook
          (lambda ()
            (column-enforce-mode t)
            (turn-on-auto-fill)))

(global-set-key (kbd "C-c q") 'auto-fill-mode)

;; set mode for certain file-types
(add-to-list 'auto-mode-alist '("raven\\.none\\'" . text-mode))

;; misc settings
; theme workaround: set background color.
(add-hook 'after-init-hook (lambda () (if (display-graphic-p) (setq bg1 "#282a36") (setq bg1 nil))))

; set default shell for ansi-term
(defvar my-term-shell "/bin/bash")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)

;; symon-mode
(setq symon-sparkline-type 'gridded)
(setq symon-monitors  '(symon-current-time-monitor
      symon-linux-cpu-monitor
      symon-linux-memory-monitor
      symon-linux-battery-monitor
      symon-linux-network-rx-monitor
      symon-linux-network-tx-monitor
      )
)
;(symon-mode)
