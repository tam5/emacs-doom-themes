;;; doom-seti-theme.el --- inspired by something -*- no-byte-compile: t; -*-
(require 'doom-themes)

;;
(defgroup doom-seti-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-seti-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-seti-theme
  :type 'boolean)

(defcustom doom-seti-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-seti-theme
  :type 'boolean)

(defcustom doom-seti-colorful-headers nil
  "If non-nil, headers in org-mode will be more colorful; which is truer to the
original Dracula Emacs theme."
  :group 'doom-dracula-theme
  :type 'boolean)

(defcustom doom-seti-comment-bg doom-seti-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-seti-theme
  :type 'boolean)

(defcustom doom-seti-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-seti-theme
  :type '(choice integer boolean))

;;
(def-doom-theme doom-seti
  "A dark theme inspired by Atom One Dark"

  ;; name        default   256       16
  ((bg         '("#171C20" "#262626" nil            )) ;; main background
   (bg-alt     '("#0D1011" "#1c1c1c" nil            )) ;; sidebar and outer background
   (base0      '("#303D4A" "#1c1c1c"   "black"      )) ;; matching paren
   (base1      '("#0D1011" "#1e1e1e" "brightblack"  )) ;; window dividers, completion
   (base2      '("#151A1D" "#2e2e2e" "brightblack"  )) ;; treemacs highlight line
   (base3      '("#303D4A" "#262626" "brightblack"  )) ;; highlight of completion
   (base4      '("#ffff00" "#3f3f3f" "brightblack"  ))
   (base5      '("#2F353C" "#525252" "brightblack"  )) ;; line numbers, inactive modeline, comments
   (base6      '("#b6b6b2" "#bbbbbb" "brightblack"  ))
   (base7      '("#ccccc7" "#cccccc" "brightblack"  ))
   (base8      '("#f8f8f2" "#dfdfdf" "white"        ))
   (fg         '("#f8f8f2" "#ffffff" "white"        ))
   (fg-alt     '("#aaaaaa" "#bfbfbf" "brightwhite"  ))

   (grey       base4)
   (red        '("#EA7686" "#ff6655" "red"          ))
   (orange     '("#ffb86c" "#ffbb66" "brightred"    ))
   (green      '("#50fa7b" "#55ff77" "green"        ))
   (teal       '("#19A288" "#0088cc" "brightgreen"  ))
   (yellow     '("#FFDF00" "#ffff88" "yellow"       ))
   (blue       '("#AED5FC" "#66bbff" "brightblue"   ))
   (dark-blue  '("#0189cc" "#0088cc" "blue"         ))
   (magenta    '("#C477DB" "#ff77cc" "magenta"      ))
   (violet     '("#bd93f9" "#bb99ff" "brightmagenta"))
   (cyan       '("#8be9fd" "#88eeff" "brightcyan"   ))
   (dark-cyan  '("#8be9fd" "#88eeff" "cyan"         ))

   ;; face categories -- required for all themes
   (highlight      yellow)
   (vertical-bar   (doom-darken base1 0.1))
   (selection      dark-blue)
   (builtin        orange)
   (comments       (if doom-seti-brighter-comments dark-cyan (doom-lighten base5 0.1)))
   (doc-comments       (if doom-seti-brighter-comments dark-cyan (doom-lighten base5 0.1)))
   (constants      dark-blue)
   (functions      teal)
   (keywords       red)
   (methods        teal)
   (operators      red)
   (type           fg)
   (strings        blue)
   (variables      orange)
   (numbers        red)
   (region         base3)

   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (level1 magenta)
   (level2 violet)
   (level3 (if doom-seti-colorful-headers green   (doom-lighten violet 0.35)))
   (level4 (if doom-seti-colorful-headers yellow  (doom-lighten magenta 0.35)))
   (level5 (if doom-seti-colorful-headers cyan    (doom-lighten violet 0.6)))
   (level6 (if doom-seti-colorful-headers orange  (doom-lighten magenta 0.6)))
   (level7 (if doom-seti-colorful-headers blue    (doom-lighten violet 0.85)))
   (level8 (if doom-seti-colorful-headers magenta (doom-lighten magenta 0.85)))
   (level9 (if doom-seti-colorful-headers violet  (doom-lighten violet 0.95)))

   (hidden     base1)
   (-modeline-bright doom-seti-brighter-modeline)
   (-modeline-pad
    (when doom-seti-padded-modeline
      (if (integerp doom-seti-padded-modeline) doom-seti-padded-modeline 4)))

   (modeline-fg     fg-alt)
   (modeline-fg-alt base5)

   (modeline-bg

    (if -modeline-bright
        (doom-darken  magenta 0.675)
      `(,(car bg) ,@(cdr base0))))
   (modeline-bg-l
    (if -modeline-bright
        (doom-darken magenta 0.6)
      `(,(doom-darken (car bg) 0.15) ,@(cdr base0))))
   (modeline-bg-inactive   (doom-darken bg 0.1))
   (modeline-bg-inactive-l `(,(doom-darken (car bg) 0.075) ,@(cdr base1))))


  ;; --- extra faces ------------------------
  ((elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   (match               :foreground yellow      :background nil :weight 'bold)
   (highlight           :background nil  :foreground fg :distant-foreground nil) ;;; buttons and stuff
   (lazy-highlight      :background nil :box `(:line-width -1 :color ,base5))
   (paren-face-match    :foreground nil   :background nil :weight 'ultra-bold :underline t)
   (minibuffer-prompt   :foreground fg-alt)

   ((line-number &override) :foreground base5)
   ((line-number-current-line &override) :foreground fg)

   (font-lock-comment-face
    :foreground comments
    :background (if doom-seti-comment-bg (doom-lighten bg 0.05)))
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments)
   (solaire-hl-line-face :background base2)
   ;; (doom-modeline-bar :background nil)
   (doom-modeline-project-root-dir :foreground fg-alt :weight 'normal)
   (doom-modeline-project-dir :foreground fg-alt :weight 'normal)
   (doom-modeline-buffer-path :foreground fg-alt :weight 'normal)
   (doom-modeline-buffer-file :foreground fg-alt :weight 'normal)
   (doom-modeline-buffer-modified :foreground fg-alt :weight 'normal)
   (doom-modeline-info :foreground fg-alt)
   ;; (doom-modeline-bar :foreground green)
   ;; (doom-modeline-highlight :foreground blue)

   (+workspace-tab-face :foreground fg-alt)
   (+workspace-tab-selected-face :foreground fg)

   (mode-line
    :family "Roboto" :height 125 :weight 'normal
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :family "Roboto" :height 125 :weight 'normal
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground nil)

   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))

   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground violet)
   (css-property             :foreground violet)
   (css-selector             :foreground green)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   ((markdown-code-face &override) :background (doom-darken 'bg 0.075))

   ;; org-mode
   ((outline-1 &override) :foreground level1)
   (outline-2 :inherit 'outline-1 :foreground level2)
   (outline-3 :inherit 'outline-1 :foreground level3)
   (outline-4 :inherit 'outline-1 :foreground level4)
   (outline-5 :inherit 'outline-1 :foreground level5)
   (outline-6 :inherit 'outline-1 :foreground level6)
   (outline-7 :inherit 'outline-1 :foreground level7)

   (org-todo :foreground orange :bold 'inherit :background (doom-darken base1 0.02))
   (org-done :foreground green :strike-through nil :background base2 :bold t)
   (org-headline-done :foreground base4 :strike-through nil)
   ((org-tag &override) :foreground (doom-lighten orange 0.3))
   (org-agenda-date :foreground cyan)
   (org-agenda-dimmed-todo-face :foreground comments)
   (org-agenda-done :foreground base4)
   (org-agenda-structure :foreground violet)
   ((org-block &override) :background (doom-darken base1 0.125) :foreground violet)
   ((org-block-begin-line &override) :background (doom-darken base1 0.125) :foreground comments)
   (org-code :foreground yellow)
   (org-column :background base1)
   (org-column-title :background base1 :bold t :underline t)
   (org-date :foreground cyan)
   (org-document-info :foreground blue)
   (org-document-info-keyword :foreground comments)
   (org-ellipsis :foreground comments)
   (org-footnote :foreground blue)
   (org-headline-base :foreground comments :strike-through t :bold nil)
   (org-link :foreground orange :underline t :weight 'bold)
   (org-priority :foreground cyan)
   (org-scheduled :foreground green)
   (org-scheduled-previously :foreground yellow)
   (org-scheduled-today :foreground orange)
   (org-sexp-date :foreground base4)
   (org-special-keyword :foreground yellow)
   (org-table :foreground violet)
   (org-upcoming-deadline :foreground yellow)
   (org-warning :foreground magenta)

   ;; tooltip and company
   (tooltip              :background bg-alt :foreground fg)
   (company-tooltip-selection     :background base3)

   ;; rjsx-mode
   (rjsx-tag :foreground magenta)
   (rjsx-attr :foreground green :slant 'italic :weight 'medium)

   ;; js2-mode
   (js2-external-variable :foreground violet)
   (js2-function-param :foreground cyan)
   (js2-jsdoc-html-tag-delimiter :foreground yellow)
   (js2-jsdoc-html-tag-name :foreground dark-blue)
   (js2-jsdoc-value :foreground yellow)
   (js2-private-function-call :foreground cyan)
   (js2-private-member :foreground base7)

   ;; web-mode
   (web-mode-builtin-face :foreground orange)
   (web-mode-css-selector-face :foreground green)
   (web-mode-html-attr-name-face :foreground green)
   (web-mode-html-tag-bracket-face :inherit 'default)
   (web-mode-html-tag-face :foreground magenta :weight 'bold)
   (web-mode-preprocessor-face :foreground orange)

   ;; helm
   (helm-bookmark-w3m :foreground violet)
   (helm-buffer-not-saved :foreground violet)
   (helm-buffer-process :foreground orange)
   (helm-buffer-saved-out :foreground fg)
   (helm-buffer-size :foreground fg)
   (helm-candidate-number :foreground bg :background fg)
   (helm-ff-directory :foreground green :weight 'bold)
   (helm-ff-executable :foreground dark-blue :inherit 'italic)
   (helm-ff-invalid-symlink :foreground magenta :weight 'bold)
   (helm-ff-prefix :foreground bg :background magenta)
   (helm-ff-symlink :foreground magenta :weight 'bold)
   (helm-grep-finish :foreground base2)
   (helm-grep-running :foreground green)
   (helm-header :foreground base2 :underline nil :box nil)
   (helm-moccur-buffer :foreground green)
   (helm-separator :foreground violet)
   (helm-source-go-package-godoc-description :foreground yellow)
   ((helm-source-header &override) :foreground magenta)
   (helm-time-zone-current :foreground orange)
   (helm-time-zone-home :foreground violet)
   (helm-visible-mark :foreground bg :background base3)

   ;; highlight-quoted-mode
   (highlight-quoted-symbol :foreground cyan)
   (highlight-quoted-quote  :foreground magenta)

   (treemacs-file-face :foreground "#aaaaaa")
   (treemacs-directory-face :foreground "#aaaaaa")
   (treemacs-root-face :foreground "#aaaaaa")


   (all-the-icons-red :foreground "#B42839")
   (all-the-icons-lred :foreground "#E54542")
   (all-the-icons-dred :foreground "#CB3837")
   (all-the-icons-red-alt :foreground "#671855")
   (all-the-icons-green :foreground "#ffffff")
   (all-the-icons-lgreen :foreground "#43D16B")
   (all-the-icons-dgreen :foreground "#ffffff")
   (all-the-icons-yellow :foreground "#F0DC3E")
   (all-the-icons-lyellow :foreground "#EED982")
   (all-the-icons-dyellow :foreground "#FAA91A")
   (all-the-icons-blue :foreground "#356EA0")
   (all-the-icons-blue-alt :foreground "#283249")
   (all-the-icons-lblue :foreground "#29A8DE")
   (all-the-icons-dblue :foreground "#1F77CE")
   (all-the-icons-maroon :foreground "#ffffff")
   (all-the-icons-lmaroon :foreground "#ffffff")
   (all-the-icons-dmaroon :foreground "#6C5FA9")
   (all-the-icons-purple :foreground "#4A37BA")
   (all-the-icons-purple-alt :foreground "#7F50B1")
   (all-the-icons-lpurple :foreground "#8C6184")
   (all-the-icons-dpurple :foreground "#542D8D")
   (all-the-icons-orange :foreground "#EF7A39")
   (all-the-icons-lorange :foreground "#F0582B")
   (all-the-icons-dorange :foreground "#F0582B")
   (all-the-icons-cyan :foreground "#00E4FF")
   (all-the-icons-cyan-alt :foreground "#35BAA0")
   (all-the-icons-lcyan :foreground "#829EC2")
   (all-the-icons-dcyan :foreground "#ffffff")
   (all-the-icons-pink :foreground "#FF4893")
   (all-the-icons-lpink :foreground "#BCA784")
   (all-the-icons-dpink :foreground "#ffffff")
   (all-the-icons-silver :foreground "#40535B")
   (all-the-icons-lsilver :foreground "#ffffff")
   (all-the-icons-dsilver :foreground "#40535B")

   )

  ;; --- extra variables ---------------------
  ()
  )

;;; doom-seti-theme.el ends here
