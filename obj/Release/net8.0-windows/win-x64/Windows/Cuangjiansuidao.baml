   M S B A M L   `   `   `  ���� A  =FrpcUI, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:FrpcUI.WindowsFrpcUI.Windows  O Kmscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e0891&clr-namespace:System;assembly=mscorlibSystem $    FrpcUI.Windows.Cuangjiansuidao   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     .localclr-namespace:FrpcUI.Windows     6sys&clr-namespace:System;assembly=mscorlib       � Title$  创建隧道��$	��700��$	��600�� � 	Resources    BoolToVisibilityConverter  ExpanderGridStyle �� 
TargetType �� Property �� Value T� Y �� Triggers �� Binding �� ElementName	 �� Value
 N� EnterActions �� TargetProperty W� From	 W� To g� Duration N� ExitActions��%�  &	        &	      �� �� " �.���  � z� T� $ 0Q� ��  �� *	IsChecked+$ AdvancedToggle��	 True
 �� .���� .��W� $, &RenderTransform.(TranslateTransform.Y)� -20 0$ 0:0:0.2D�W� $ Opacity� 0 1$ 0:0:0.2D� �� .���� .��W� $, &RenderTransform.(TranslateTransform.Y)� 0 -20$ 0:0:0.2D�W� $ Opacity� 1 0$ 0:0:0.2D�.��� $��15q� � RowDefinitions �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $��* ��� $
��Auto �.+��� $��0��$��创建隧道��$��20(�$
��Bold"�$��0,0,0,15q�� $��1��$��0,0,0,15q� � ColumnDefinitions �� $
��Auto ��� $��* ��� $
��Auto ��� $��* �.+��� $��0��$��隧道名称��$��Center=�$��0,0,10,0q��� $��1�� �� CornerRadius$ 4��$��1q����#ABADB3._��� -    ��Name$ 
TunnelName��$�� ��$��Center=�$��0q�
������ $��5q��� $��2��$��本地IP��$��Center=�$��	20,0,10,0q�$��48���� $��3��$ 4��$��1q����#ABADB3._��� -   $ LocalIP��$��	127.0.0.1��$��Center=�$��0q�
������ $��5q�� $��2��$��0,0,0,15q�$��Center=� �� $
��Auto ��� $��* ��� $
��Auto ��� $��* �.+��� $��0��$��节点选择��$��Center=�$��0,0,10,0q��� $��1��$ 4��$��1q����#ABADB3._��� -    �� SelectedIndex$ 0��$��Center=� �� 
IsEditable$
 True�� �� 
IsReadOnly$
 True��$��0q�
������ $��25.24�� �� Text �� *SelectedNode+ �� Mode$ OneWay=��� $��2��$��端口类型��$��Center=�$��	20,0,10,0q��� $��3��$ 4��$��1q����#ABADB3._��� -    ��Name$ PortType��$ 0��$��Center=�$��0q�
������ $��25.24��.@��� .��TCP�� .��UDP�� .��HTTP�� .��HTTPS� $��3��$��0,0,0,15q� �� $
��Auto ��� $��* ��� $
��Auto ��� $��* �.+��� $��0��$��内网端口��$��Center=�$��0,0,10,0q��� $��1��$ 4��$��1q����#ABADB3._��� -   $ 	InnerPort��$�� ��$��Center=�$��0q�
������ $��5q��� $��2��$��外网端口��$��Center=�$��	20,0,10,0q��� $��3��$ 4��$��1q����#ABADB3._��� -   $ 	OuterPort��$6��0端口类型为TCP或UDP时输入，否则不填��$��Center=�$��0q�
������ $��5q�� $��4��$��0,0,0,15q� �� $
��Auto ��� $��* �.+��� $��0��$��输入域名��$��Center=�$��0,0,10,0q��� $��1��$ 4��$��1q����#ABADB3._��� -   $ Yuming��$9��3端口类型为HTTP或HTTPS时输入，否则不填��$��Center=�$��0q�
������ $��5q��� $��5��
�������$��0,1,0,0q�$��0,0,0,10q� �� Padding$	 0,5q�._�d� -    d�Name$ AdvancedToggle��$��高级设置��$	��670��$��0q�
������ $
��Left=�$��0q�  BorderlessToggleButton#��[  � FocusVisualStyle Z� � $��6��$��	10,0,0,15q�#��[  J� Opacity$ 0Q�y��� *	IsChecked+$ AdvancedToggle�� �� 	Converter# [   �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto �.+��� $��0��$E��?不懂请不要设置，否则可能会导致无法启动隧道��
���  ��$��0,0,0,10q��� $��1�� �� Orientation$ 
Horizontal=�$��0,0,0,10q�.+��� -	     ��Name$  DataEncryptionCheckBox��$��数据加密��$��0,0,20,0q��� -
   $  DataCompressionCheckBox��$��数据压缩���� $��2��$��额外参数��$��0,0,0,5q��� $��3��$ 4��$��1q����#ABADB3._��� -   $ ExtraParams��$��60��$�� ��! �� TextWrapping$
! Wrap=�" �� AcceptsReturn$
" True��$��0q�
������ $��5q��� $��7��$ 
Horizontal=�$��Right=�.+��� -   $��随机外网端口��  ModernButton#��[ �� -   $��随机隧道名��#��[ �� -   $��	上一步��#��[ �� -   $��取消��  DangerButton#��[ �� -   $��确定��  PrimaryButton#��[ 