   M S B A M L   `   `   `  ���� A  =FrpcUI, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:FrpcUIFrpcUI      FrpcUI.MainWindow   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     &localclr-namespace:FrpcUI     -   $
��home��  � Title$  FrpcUI��$
��1200��$	��670�� � WindowStartupLocation$ CenterScreen=� � WindowStyle$
 None=�
������  � AllowsTransparency$
 True�� � 
ResizeMode$ 	CanResize=� � WindowState$ Normal=�.���� -    �� CornerRadius$ 8��   PrimaryBackgroundColor#���   ._��  � ShowGridLines$ False�� � ColumnDefinitions �� $	��200 ��� $��* �.+��� $ 8 0 0 8��  SecundaryBackgroundColor#���  ._�� -   	 �Name$	 gridMenu��$	��200��
 � RowDefinitions
 �� $��60 ��� $��80 ��� $
��Auto ��� .+��� $��1�� �� Orientation$ 
Horizontal=�$	��Top=�.+�F�   logo#���  $��17 0 0 0q� �� Stretch$
 Fill=�  PrimaryBlueColor#���  $��25��$��25��$
��Left=��� $��Frpc UI��#���  $
��Bold"�$��20(�$��Center=�$
��Left=�$��8 0 0 0q�$��41����Z� ��Z� �� $��3��.+�	� -    	�Name$ rdHome�� d� 	IsChecked$
 TrueY�$��主页��  MenuRadioButtonStyle#���    home
 � Tag# �  $��	0 10 0 10q����� 	� -   $ SuiDao��$��节点隧道��#���   
 server# �  $��	0 10 0 10q���Z� �� -    ��Name$ SubButtonsPanel��$��20,0,0,0q�$y�	Collapsed=�$��0��.+�	� -   $ rdSub1��$��隧道列表��#���    sub1# �  $��0,5,0,5q�	� -   $ rdSub2��$��配置文件��#���    sub2# �  $��0,5,0,5q�	� -	   $ rdNotes��$��域名管理��#���   		 notes# � 	 $��	0 10 0 10q�	� -
   $ 
rdSettings��$��设置��#���   
 settings# � 
 $��	0 10 0 10q�	� -   $ 	rdPayment��$��关于��#���   
 guanyu# �  $��	0 10 0 10q��� $��3��$��Bottom=����� *UserProfiles+���� .R��� $ 
Horizontal=�$	��200��$��0 0 0 20q����� .R��� $ 
Horizontal=�$��0 0 0 0q�$
��Left=�.+��� $��32��$��32��$��15 0 0 0q� �� BitmapScalingMode$ HighQuality=����� *	UserImg+ J� Clip @�  @� Center$ 16,16&� @� RadiusX$ 16Q� @� RadiusY$ 16Q��� $ Vertical=�$��0 0 0 0q�$
��Left=�.+��� $
��Left=�  TextPrimaryColor#���  $��14(�$��SemiBold"� �� TextAlignment$
 Left=�$��5,0,0,0q����� *Name+��   PrimaryGrayColor#���  $��11(�$��Regular"�$
 Left=�$
��Left=�$��5,0,0,0q����� *Mail+� $��1��
 �� $��60 ��� .+��� $��0��$��Right=�$	��Top=�$��0,0,15,0q�$��50��$ 
Horizontal=�$��RightToLeft=�.+��� -    ��Name$ btnClose��  IconButtonsStyle#��[  	 close#���  $ IsCloseButton���� -   $ 
btnRestore��$	��5,0q�����  �� 
TargetType" �� �� BasedOn# [ .���  �� Property � ��  maximize �� Value# �  �� -   $ btnMinimize��#��[   minimize#���   � -   $��PagesNavigation��$��1��$��10,55,10,10q�$��Stretch=�$��Stretch=�