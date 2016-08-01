;; Macの場合
(require 'cask)
;; Linuxの場合
;; use-package
 
(cask-initialize)
(require 'use-package)

;; 日本語IM用の設定
(setq default-input-method "MacOSX")

;; 日本語の設定（UTF-8）
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)

;; Auto-complete
(use-package auto-complete)

;; '¥' を入力したら '\' となるように
(define-key global-map [?¥] [?\\])

;; 警告音もフラッシュも全て無効
(setq ring-bell-function 'ignore)

;;;　行番号の表示
(global-linum-mode t)

;;; 現在行を目立たせる
(global-hl-line-mode)

;; バックアップファイルを作らないようにする
(setq make-backup-files nil)
;;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;;; キーバインド
(define-key global-map (kbd "C-h") 'delete-backward-char) ; 削除
(define-key global-map (kbd "M-?") 'help-for-help)        ; ヘルプ
(define-key global-map (kbd "C-z") 'undo)                 ; undo
(define-key global-map (kbd "C-c i") 'indent-region)      ; インデント
(define-key global-map (kbd "C-c C-i") 'hippie-expand)    ; 補完
;(define-key global-map (kbd "C-c ;") 'comment-dwim)       ; コメントアウト
(define-key global-map (kbd "C-o") 'toggle-input-method)  ; 日本語入力切替
;(define-key global-map (kbd "M-C-g") 'grep)               ; grep
(define-key global-map (kbd "C-[ M-C-g") 'goto-line)      ; 指定行へ移動

;;; 対応する括弧を光らせる。
(show-paren-mode 1)
;;; ウィンドウ内に収まらないときだけ括弧内も光らせる。
(setq show-paren-style 'mixed)

;;; 日本語入力時、カーソル色を変える
(when (fboundp 'mac-input-source)
  (defun my-mac-selected-keyboard-input-source-chage-function ()
    "英語のときはカーソルの色を黄色に、日本語のときは赤にします."
    (let ((mac-input-source (mac-input-source)))
      (set-cursor-color
       (if (string-match "\\.US$" mac-input-source)
	   "Yellow" "Red"))))
  (add-hook 'mac-selected-keyboard-input-source-change-hook
	    'my-mac-selected-keyboard-input-source-chage-function))


;;; Appearences
;(use-package color-theme-tango)
;(use-package color-theme-solarized)
;(use-package solarized-theme)
(load-theme 'solarized-dark t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(initial-frame-alist (quote ((top . 150) (left . 150)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; Python
(use-package jedi)
(add-hook 'python-mode-hook
          '(lambda()
             (jedi:ac-setup)
             (setq jedi:complete-on-dot t)
             (local-set-key (kbd "M-TAB") 'jedi:complete)))


(package-initialize)
