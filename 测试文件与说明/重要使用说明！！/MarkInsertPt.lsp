(defun c:MarkInsertPt (/ ss i ent obj pt lay col ltyp)
  ;; 设置命令回显，防止刷屏
  (setvar 'CMDECHO 0)
  
  ;; 提示用户选择图块
  (princ "\n请选择要标记插入点的图块 (Enter 结束): ")
  
  ;; 创建选择集，只选择图块 (Block Reference)
  (if (setq ss (ssget '((0 . "INSERT"))))
    (progn
      (setq i 0)
      (repeat (sslength ss)
        (setq ent (ssname ss i))
        (setq obj (vlax-ename->vla-object ent))
        
        ;; 获取图块的插入点 (实际坐标)
        ;; vlax-get 返回的是三维坐标列表 (x y z)
        (setq pt (vlax-get obj 'InsertionPoint))
        
        ;; 获取图块所在的图层
        (setq lay (vlax-get obj 'Layer))
        
        ;; 获取图块的颜色和线型 (可选，为了点看起来和图块一致)
        (setq col (vlax-get obj 'Color))
        (setq ltyp (vlax-get obj 'Linetype))
        
        ;; 创建点对象
        ;; 注意：如果点样式设置为不可见，用户可能看不到点，请确保 SETPOINT 样式可见
        (setq newPt (vla-addpoint (vla-get-ModelSpace (vla-get-ActiveDocument (vlax-get-acad-object)))
                                  (vlax-3d-point pt)))
        
        ;; 设置点的图层
        (vla-put-Layer newPt lay)
        
        ;; 设置点的颜色 (如果图块颜色是 ByLayer (256)，则点也设为 ByLayer)
        (if (= col 256)
          (vla-put-Color newPt 256)
          (vla-put-Color newPt col)
        )
        
        ;; 设置点的线型 (如果图块线型是 ByLayer，则点也设为 ByLayer)
        (if (= (vlax-get obj 'Linetype) "ByLayer")
          (vla-put-Linetype newPt "ByLayer")
          (vla-put-Linetype newPt ltyp)
        )
        
        ;; 可选：将点设置为可见的样式（如果当前点样式是点，可能看不清）
        ;; 这里不强制修改点样式，以免干扰用户设置，但提示用户
        (setq i (1+ i))
      )
      (princ (strcat "\n成功标记 " (itoa i) " 个图块的插入点。"))
    )
    (princ "\n未选择任何图块。")
  )
  
  ;; 恢复命令回显
  (setvar 'CMDECHO 1)
  (princ)
)

;; 加载提示
(princ "\n已加载 MarkInsertPt 命令。输入 'MarkInsertPt' 运行。")