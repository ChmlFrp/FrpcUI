   M S B A M L   `   `   `  ����A  =FrpcUI, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:FrpcUIFrpcUI  5   	       FrpcUI.MainWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   &localclr-namespace:FrpcUI     5   	   -   5        $
��home��5        � Title$  FrpcUI��5   	   $
��1200��6   $	��670��6%    � WindowStartupLocation$ CenterScreen=�5	   	    � WindowStyle$
 None=�6.   
������  � AllowsTransparency$
 True��5
   "    � 
ResizeMode$ 	CanResize=�5   	    � WindowState$ Normal=�6    .��5      �� -   5         �� CornerRadius$ 8��5         SecundaryBackgroundColor#���   6   ._�5   
   �  � ShowGridLines$ False��6    � ColumnDefinitions 5      �� 5      $	��200 �6#   �� 5      $��* �6#   .+�5      �� $ 8 0 0 8��6   #���   6,   ._�5      � -   5        	 �Name$	 gridMenu��5      $	��200��6)   
 � RowDefinitions
 5      �� 5      $��60 �6(   �� 5      $��80 �6(   �� 5      $
��Auto �6(   �� 5      .+�5      �� $��1��6!    �� Orientation$ 
Horizontal=�6.   $	��Top=�6G   .+�5      F�   logo#���  6   $��17 0 0 0q�6=    �� Stretch$
 Fill=�6O     PrimaryBlueColor#���  6^   $��25��6�   $��25��6�   $
��Left=�6�   �� 5       $��Frpc UI��6!   #���  63   $
��Bold"�6c   $��20(�6u   $��Center=�6�   $
��Left=�6�   $��8 0 0 0q�6�   $��41��6�   ��6�   Z� ��6�   Z� 6�   5!      �� 5&      $��3��6!   .+�5'      	� -   5         	�Name$ rdHome��5'   &    d� 	IsChecked$
 TrueY�67   $��主页��6H     MenuRadioButtonStyle#���  6U     home
 � Tag# �  6�   $��	0 10 0 10q�6�   ��5(      �� 5)   "   5+      	� 5,      -   5        $ SuiDao��5,   &   $��节点隧道��66   #���  6E    
 server# �  6t   $��	0 10 0 10q�6�   ��6�   Z� 5-   <   �� 50      -   5         ��Name$ SubButtonsPanel��50   %   $��20,0,0,0q�6>   $y�	Collapsed=�6P   $��0��6g   .+�51      	� -   5        $ rdSub1��51   *   $��隧道列表��6V   #���  6e     sub1# �  6�   $��0,5,0,5q�6�   	� 52      -   5        $ rdSub2��52   *   $��配置文件��6V   #���  6e     sub2# �  6�   $��0,5,0,5q�6�   54      	� 56      -	   5        $ rdNotes��56   &   $��域名管理��6L   #���  6[    	 notes# �  6�   $��	0 10 0 10q�6�   	� 57      -
   5        $ 
rdSettings��57   &   $��设置��6Q   #���  6_    	 settings# � 	 6�   $��	0 10 0 10q�6�   	� 58      -   5        $ 	rdPayment��58   &   $��关于��6N   #���  6\    

 guanyu# � 
 6�   $��	0 10 0 10q�6�   59      �� 5;      $��3��6#   $��Bottom=�60   ��6K   �� *UserProfiles+��5<      �� 5=      .R�5>   "   �� $ 
Horizontal=�6-   $	��200��6F   $��0 0 0 20q�6R   5?      ��5A      �� 5B      .R�5C   "   �� $ 
Horizontal=�6-   $��0 0 0 0q�6F   $
��Left=�6W   .+�5D   &   �� $��32��6G   $��32��6R   $��15 0 0 0q�6^    �� BitmapScalingMode$ HighQuality=�5E   ,   ��5D   ,   �� *	UserImg+ J� Clip 5F   *   @� 5G   .    @� Center$ 16,16&�6>    @� RadiusX$ 16Q�6M    @� RadiusY$ 16Q�6Z   5I   '   �� 5J   &   $ Vertical=�61   $��0 0 0 0q�6H   $
��Left=�6Y   .+�5K   *   �� $
��Left=�6J     TextPrimaryColor#���  6e   $��14(�6�   $��SemiBold"�6�    �� TextAlignment$
 Left=�6�   $��5,0,0,0q�6�   ��64   �� *Name+6�   �� 5L   *     PrimaryGrayColor#���  6J   $��11(�6z   $��Regular"�6�   $
 Left=�6�   $
��Left=�6�   $��5,0,0,0q�6�   ��64   �� *Mail+6�   5M   '   5N   #   5O      5Q      5T      5U      � 5Y      $��1��6   
 5Z      �� 5[      $��60 �6$   �� 5\      .+�5`      �� $��0��6   $��Right=�6*   $	��Top=�6F   $��0,0,15,0q�6^   $��50��6p   $ 
Horizontal=�6|   $��RightToLeft=�6�   .+�5a      �� -   5         ��Name$ btnClose��5a        IconButtonsStyle#��[ 6/    	 close#���  6Y   $ IsCloseButton��6�   �� 5b      -   5        $ 
btnRestore��5b      $	��5,0q�61   ��5c      �� 5d       �� 
TargetType" ��6$    �� BasedOn# [ 6A   .�5e   "   ��  �� Property � ��  maximize �� Value# �  6<   5f      5h      �� 5i      -   5        $ btnMinimize��5i      #��[ 62     minimize#���  6\   6�   5j      5l       � 5m      -   5        $��PagesNavigation��5m      $��1��6+   $��10,55,10,10q�6;   $��Stretch=�6P   $��Stretch=�6n   6�   5o      5p      5r      