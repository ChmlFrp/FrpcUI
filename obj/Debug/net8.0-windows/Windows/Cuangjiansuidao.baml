   M S B A M L   `   `   `  ����A  =FrpcUI, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:FrpcUI.WindowsFrpcUI.Windows  5   	   O Kmscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e0891&clr-namespace:System;assembly=mscorlibSystem 5   	   $    FrpcUI.Windows.Cuangjiansuidao   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   .localclr-namespace:FrpcUI.Windows     5   	   6sys&clr-namespace:System;assembly=mscorlib     5   	     � Title$  创建隧道��5	   	   $	��700��6   $	��600��6"    � 	Resources 5         BoolToVisibilityConverter  ExpanderGridStyle �� 
TargetType �� Property �� Value T� Y �� Triggers �� Binding �� ElementName	 �� Value
 N� EnterActions �� TargetProperty W� From	 W� To g� Duration N� ExitActions��%�  &	        &	      �� 5   
   6'   �� 5   
   " �6*   .�5      ��  � z� 5      T� 5      $ 0Q�6)   5       5      �� 5       6   �� *	IsChecked+$ AdvancedToggle��	 True6X   
 5      �� 5      .��5      �� .��5   "   W� $, &RenderTransform.(TranslateTransform.Y)�62    -205   *    065   $ 0:0:0.2D�6<   W� 5   "   $ Opacity�62    05   *    163   $ 0:0:0.2D�6:   5       5!       5#      �� 5$      .��5%      �� .��5&   "   W� $, &RenderTransform.(TranslateTransform.Y)�62    05'   *    -2063   $ 0:0:0.2D�6<   W� 5(   "   $ Opacity�62    15)   *    063   $ 0:0:0.2D�6:   5*      5+      5-      5/      50      .��53      � $��15q�6    � RowDefinitions 54   
   �� 55      $
��Auto �6   �� 56      $
��Auto �6   �� 57      $
��Auto �6   �� 58      $
��Auto �6   �� 59      $
��Auto �6   �� 5:      $
��Auto �6   �� 5;      $��* �6   �� 5<      $
��Auto �6   .+�5@   
   �� $��0��6   $��创建隧道��6!   $��20(�6-   $
��Bold"�6;   $��0,0,0,15q�6M   � 5C   
   $��1��6   $��0,0,0,15q�6    � ColumnDefinitions 5D      �� 5E      $
��Auto �6#   �� 5F      $��* �6#   �� 5G      $
��Auto �6#   �� 5H      $��* �6#   .+�5K      �� $��0��6   $��隧道名称��6(   $��Center=�64   $��0,0,10,0q�6O   �� 5L      $��1��6    �� CornerRadius$ 4��6%   $��1q�66   ���#ABADB3._�5M      �� -   5         ��Name$ 
TunnelName��5M      $�� ��6.   $��Center=�66   $��0q�6Q   
������ $��5q�6~   5N      �� 5P      $��2��6   $��本地IP��6(   $��Center=�64   $��	20,0,10,0q�6O   $��48��6b   �� 5Q      $��3��6   $ 4��6%   $��1q�66   ���#ABADB3._�5R      �� -   5        $ LocalIP��5R      $��	127.0.0.1��6+   $��Center=�6<   $��0q�6W   
������ $��5q�6�   5S      5T      � 5W   
   $��2��6   $��0,0,0,15q�6   $��Center=�6.    5X      �� 5Y      $
��Auto �6#   �� 5Z      $��* �6#   �� 5[      $
��Auto �6#   �� 5\      $��* �6#   .+�5_      �� $��0��6   $��节点选择��6(   $��Center=�64   $��0,0,10,0q�6O   �� 5`      $��1��6   $ 4��6%   $��1q�66   ���#ABADB3._�5a      �� -   5         �� SelectedIndex$ 0��5a      $��Center=�5b       �� 
IsEditable$
 True��5e       �� 
IsReadOnly$
 True��5f      $��0q�5g      
������ $��25.24��5h   ,    �� Text 5d      �� *SelectedNode+ �� Mode$ OneWay=�5h   ,   5i      �� 5k      $��2��6   $��端口类型��6(   $��Center=�64   $��	20,0,10,0q�6O   �� 5l      $��3��6   $ 4��6%   $��1q�66   ���#ABADB3._�5m      �� -   5         ��Name$ PortType��5m      $ 0��6-   $��Center=�6?   $��0q�6�   
������ $��25.24��6�   .@�5n      �� .��6#   TCP6(   �� 5o      .��6#   UDP6(   �� 5p      .��6#   HTTP6)   �� 5q      .��6#   HTTPS6*   5r      5s      5t      � 5w   
   $��3��6   $��0,0,0,15q�6    5x      �� 5y      $
��Auto �6#   �� 5z      $��* �6#   �� 5{      $
��Auto �6#   �� 5|      $��* �6#   .+�5      �� $��0��6   $��内网端口��6(   $��Center=�64   $��0,0,10,0q�6O   �� 5�      $��1��6   $ 4��6%   $��1q�66   ���#ABADB3._�5�      �� -   5        $ 	InnerPort��5�      $�� ��6-   $��Center=�65   $��0q�6P   
������ $��5q�6}   5�      �� 5�      $��2��6   $��外网端口��6(   $��Center=�64   $��	20,0,10,0q�6O   �� 5�      $��3��6   $ 4��6%   $��1q�66   ���#ABADB3._�5�      �� -   5        $ 	OuterPort��5�      $6��0端口类型为TCP或UDP时输入，否则不填��6-   $��Center=�6I   $��0q�6d   
������ $��5q�6�   5�      5�      � 5�   
   $��4��6   $��0,0,0,15q�6    5�      �� 5�      $
��Auto �6#   �� 5�      $��* �6#   .+�5�      �� $��0��6   $��输入域名��6(   $��Center=�64   $��0,0,10,0q�6O   �� 5�      $��1��6   $ 4��6%   $��1q�66   ���#ABADB3._�5�      �� -   5        $ Yuming��5�      $9��3端口类型为HTTP或HTTPS时输入，否则不填��5�      $��Center=�5�      $��0q�5�      
������ $��5q�5�      5�      5�      �� 5�   
   $��5��6   
�������$��0,1,0,0q�66   $��0,0,0,10q�6P    �� Padding$	 0,5q�6b   ._�5�      d� -   5         d�Name$ AdvancedToggle��5�      $��高级设置��5�      $	��670��5�      $��0q�5�      
������ $
��Left=�5�      $��0q�5�        BorderlessToggleButton#��[ 5�       � FocusVisualStyle 5�      Z� 5�      5�      � 5�   
   $��6��6   $��	10,0,0,15q�6   #��[ 5�       J� Opacity$ 0Q�5�      y�5�      �� *	IsChecked+$ AdvancedToggle�� �� 	Converter# [   5�      �� 5�      $
��Auto �6    �� 5�      $
��Auto �6    �� 5�      $
��Auto �6    �� 5�      $
��Auto �6    .+�5�      �� $��0��6   $E��?不懂请不要设置，否则可能会导致无法启动隧道��6%   
���  ��$��0,0,0,10q�6S   �� 5�      $��1��6    �� Orientation$ 
Horizontal=�6&   $��0,0,0,10q�6?   .+�5�      �� -	   5          ��Name$  DataEncryptionCheckBox��5�      $��数据加密��6;   $��0,0,20,0q�6J   �� 5�      -
   5        $  DataCompressionCheckBox��5�      $��数据压缩��6<   5�      �� 5�      $��2��6   $��额外参数��6%   $��0,0,0,5q�61   �� 5�      $��3��6   $ 4��6"   $��1q�63   ���#ABADB3._�5�      �� -   5        $ ExtraParams��5�      $��60��6/   $�� ��6;   ! �� TextWrapping$
! Wrap=�6C   " �� AcceptsReturn$
" True��6W   $��0q�6l   
������ $��5q�6�   5�      5�      �� 5�   
   $��7��6   $ 
Horizontal=�6"   $��Right=�6;   .+�5�      �� -   5        $��随机外网端口��5�        ModernButton#��[ 6&   6L   �� 5�      -   5        $��随机隧道名��5�      #��[ 6%   6K   �� 5�      -   5        $��	上一步��5�      #��[ 6#   6I   �� 5�      -   5        $��取消��5�        DangerButton#��[ 6"   6H   �� 5�      -   5        $��确定��5�        PrimaryButton#��[ 6"   6I   5�      5�      5�      