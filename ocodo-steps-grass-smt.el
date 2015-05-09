;;; ocodo-steps-grass-smt --- Yet another attempt at a super cool modeline for Emacs
;;
;;; Commentary:
;;
;; Made with the svg-mode-line-themes toolkit from Sabof.
;; https://github.com/sabof/svg-mode-line-themes
;;
;;; Code:

(require 'ocodo-smt-overrides)

(setq ocodo-steps-grass:fileurl-prefix
      (concat "file://" (file-name-directory (or load-file-name buffer-file-name))))

(smt/defrow default-left
  :margin 5
  :widgets '(buffer-info buffer-name buffer-dirty)
  :align "left")

(smt/defrow default-position
  :margin 6
  :widgets '(position-info)
  :align "right")

(smt/defrow default-right
  :margin 25
  :widgets '(major-mode version-control minor-modes)
  :align "right")

(defun ocodo-steps-grass:smt/background (theme)
  (ocodo:smt/edge-image theme (concat ocodo-steps-grass:fileurl-prefix "images/steps-grass.svg")))

(defun ocodo-steps-grass:smt/overlay (theme)
  (ocodo:smt/overlay theme))

(defun smt/ocodo-steps-grass-buffer-name-style (widget)
  (list :font-weight "normal"
        :font-size "8pt"
        :font-family "sans-serif"
        :fill (if (smt/window-active-p) "#FFFFFF" "#666666")))

(defun smt/ocodo-steps-grass-major-mode-style (widget)
  (list :font-weight "normal"
        :font-size "10pt"
        :font-family "sans-serif"
        :fill (if (smt/window-active-p) "#AAAAAA" "#666666")))

(defun smt/ocodo-steps-grass-info-style (widget)
  (list :font-weight "normal"
        :font-size "6pt"
        :font-family "sans-serif"
        :fill (if (smt/window-active-p) "#999999" "#555555")))

(defun smt/ocodo-steps-grass-position-info-style (widget)
  (list :font-weight "normal"
        :font-size "8pt"
        :fill (if (smt/window-active-p) "#DDDDDD" "#999999")))

(defun smt/ocodo-steps-grass-dirty-style (widget)
  (list :font-weight "normal"
        :font-size "11pt"
        :font-family "sans-serif"
        :fill (if (and (or buffer-file-name buffer-offer-save) (buffer-modified-p))
                  ;; Dirty
                  (if (smt/window-active-p) "#FF6060" "#763030")
                ;; Untouched
                (if (smt/window-active-p) "#1F4F25" "#143519"))))

(defun smt/ocodo-steps-grass-minor-mode-style (widget)
  (list :font-weight "normal"
        :font-size "6pt"
        :fill (if (smt/window-active-p) "#FFFFFF" "#666666")))

(defun smt/ocodo-steps-grass-version-control-style (widget)
  (list :font-weight "normal"
        :font-size "8pt"
        :font-family "sans-serif"
        :fill (if (smt/window-active-p) "#60ACB1" "#365E63")))

(smt/deftheme ocodo-steps-grass:smt
  :pixel-height 26
  :background 'ocodo-steps-grass:smt/background
  :overlay    'ocodo-steps-grass:smt/overlay
  :local-widgets
  ;;; Note order of widgets are determined by smt/defrows above.
  (list (cons 'major-mode
              (smt/make-widget
               :prototype 'major-mode
               :style 'smt/ocodo-steps-grass-major-mode-style))

        (cons 'minor-modes
              (smt/make-widget
               :prototype 'minor-modes
               :style 'smt/ocodo-steps-grass-minor-mode-style))

        (cons 'version-control
              (smt/make-widget
               :prototype 'version-control
               :style 'smt/ocodo-steps-grass-version-control-style))

        (cons 'position-info
              (smt/make-widget
               :prototype 'position-info
               :style 'smt/ocodo-steps-grass-position-info-style))

        (cons 'buffer-info
              (smt/make-widget
               :prototype 'buffer-info
               :style 'smt/ocodo-steps-grass-info-style))

        (cons 'buffer-dirty
              (smt/make-widget
               :prototype 'buffer-dirty
               :style 'smt/ocodo-steps-grass-dirty-style))

        (cons 'buffer-name
              (smt/make-widget
               :prototype 'buffer-name
               :style 'smt/ocodo-steps-grass-buffer-name-style)))

  :rows (list 'default-left 'default-position 'default-right))

(ocodo:smt/setup 17 "Menlo")

(provide 'ocodo-steps-grass-smt)

;; Hi-lock: (("(\\(smt/[^ ]*\\)" (1 ' font-lock-keyword-face append)))
;; Hi-lock: end
;; Local Variables:
;; eval: (when (fboundp 'rainbow-mode) (rainbow-mode +1))
;; eval: (hi-lock-mode)
;; End:

;;; ocodo-steps-grass-smt.el ends here