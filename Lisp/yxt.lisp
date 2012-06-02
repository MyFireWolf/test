(require 'cl-gtk2-gtk)
(defstruct tvi title value)
(defun run ()
    (gtk:within-main-loop
      (let* ((window (make-instance 'gtk:gtk-window
                                   :type :toplevel
                                   :window-position :center
                                   :title "Hello world!"
                                   :default-width 300
                                   :default-height 100))
            (button (make-instance 'gtk:button :label "Hello, world!"))
            (vbox (make-instance 'gtk:v-box))
            (hbox (make-instance 'gtk:h-box))
            (scroll (make-instance 'gtk:scrolled-window :hscrollbar-policy :automatic
                                   :vscrollbar-policy :automatic))
            
            (model (make-instance 'gtk:array-list-store))
            (treeview (make-instance 'gtk:tree-view :model model))
              
            (col (make-instance 'gtk:tree-view-column :title "Slot name"))
            (cr (make-instance 'gtk:cell-renderer-text))
            
            )
            
            (gtk:store-add-column model "gchararray" #'tvi-title)    
       
        ;;(gobject:g-signal-connect button "clicked"
          ;;   (lambda (b) (declare (ignore b))))

           (gtk:tree-view-column-pack-start col cr)
           (gtk:tree-view-column-add-attribute col cr "text" 0)
           (gtk:tree-view-append-column treeview col)

        (gtk:container-add window vbox)
        (gtk:box-pack-start vbox hbox)
        (gtk:box-pack-start hbox button)
        (gtk:box-pack-start vbox scroll)      
        (gtk:container-add scroll treeview)
        (gtk:widget-show window :all t))))


(defun demo-class-browser ()  
    (gtk:within-main-loop
      (let* ((window (make-instance 'gtk:gtk-window
                                    :window-position :center
                                    :title "Class Browser"
                                    :default-width 400
                                    :default-height 600))
            
             (scroll (make-instance 'gtk:scrolled-window
                                    :hscrollbar-policy :automatic
                                    :vscrollbar-policy :automatic))
             (model (make-instance 'gtk:array-list-store))
             (treeview (make-instance 'gtk:tree-view :model model)))   
             (gtk:store-add-column slots-model "gchararray" #'tvi-title)
             
          (gtk:container-add window scroll)   
          (gtk:container-add scroll treeview)
        
          
        (gtk:widget-show window)
        )
     )
)


(defun test-builder ()
  (gtk:within-main-loop
    (let* ((builder (make-instance 'gtk:builder)))
      (gtk:builder-add-from-file  builder "c:/f.glade") 
      (gtk:widget-show (gtk:builder-get-object builder "window1"))
     )
   )
 )


(defun mainwin ()
  (gtk:within-main-loop
     (let* 
         (
          (window (make-instance 'gtk:gtk-window
                                   :type :toplevel
                                   :window-position :center
                                   :title "Hello world!"
                                   :default-width 300
                                   :default-height 100))
          (scroll (make-instance 'gtk:scrolled-window))
          (modle (make-instance 'gtk:array-list-store))
          (treeview (make-instance 'gtk:tree-view :model modle))
          (cl (make-instance 'gtk:tree-view-column :title "name"))
          (cr (make-instance 'gtk:cell-renderer-text))
          )
       (gtk:store-add-column modle "gchararray" #'tvi-title)
       (gtk:tree-view-column-pack-start cl cr)
       (gtk:tree-view-column-add-attribute cl cr "text" 0)
       (gtk:tree-view-append-column treeview cl)
       (gtk:container-add window scroll)
       (gtk:container-add scroll treeview)
       (gtk:widget-show window)
     )

   )


)