   M S B A M L   `   `   `  ����A  =FrpcUI, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:FrpcUIFrpcUI  5          
FrpcUI.App   5      W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5      R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      &localclr-namespace:FrpcUI     5        �� 	Resources  5	       �� MergedDictionaries �� Source �� 
TargetType �� Property �� Value   	TitleText  
NormalText 
 button �� 
TargetType �� CornerRadius �� Padding	 �� Triggers
 P� Property P� Value  buttonCircle  imgClose �� ScaleX �� ScaleY  textHint  textBox  HiddenNavigationStyle  
mainButton 	 RoundButtonStyle 
 TabItemStyle  ProgressBarStyle  TextBox  ModernButtonStyle  BorderlessToggleButton  ModernButton ��Name �� Triggers �� 
TargetName  PrimaryButton �� BasedOn  DangerButton  RoundedComboBoxStyle �� 	ClickMode � Cursor J� IsHitTestVisible � ToolTip � Triggers :� RoutedEvent �� TargetProperty g� Duration g� FillBehavior �� Value �� KeyTime ��Name �� SelectionBoxItem �� SelectionBoxItemTemplate  �Name! �� IsDropDownOpen" � AllowsTransparency# � 	StaysOpen$ �� MaxDropDownHeight  AnimatedRadioButton% �� Orientation& A�Name' J� Opacity( J� RenderTransformOrigin) N� EnterActions* �� 
TargetName	+ W� To  EaseOut, W� EasingFunction- N� ExitActions2  ,System.Windows.Media.Animation.QuadraticEase7  1System.Windows.Media.Animation.EasingFunctionBase.   
EasingMode�� 5   
    5      �� 5      $ Themes/LightTheme.xaml?�6%   �� 5      $ Assets/Icons/Icons.xaml?�6%   �� 5      $ Styles/MainStyle.xaml?�6%   %<-  '�       &	  �     &	 �    &	 �    &	 �    &	     &	 �	    &	 �
    &	 �    &	 !    &		 R    &	
 U    &	 �    &	 �    &	 �    &	 t    &	 �    &	 0    7  &	 j    7  &	 V    &	 I%    7  7  7  7  &	 ',    �� 5      " �6   .�5      ��  �@�OverridesDefaultStyle$
 True��6:   �� 5       �@�AllowsTransparency$
 True��67   �� 5       �@�WindowStyle$
 None=�60   �� 5       � ��
 ���� 6/   5      �� 5      " ��6&   .�5       ��  � ��$ 36(�6-   �� 5!       � ��$
 Bold"�6/   �� 5"       �@��TextAlignment$ Center=�62   �� 5#       � �� �#FFFFFF6/   5$      �� 5'      " ��6'   .�5(      ��  � ��$ 16(�6-   �� 5)       �@��
LineHeight$ 28��6/   �� 5*       � ��$
 Wrap=�61   �� 5+       �@��TextAlignment$ Center=�62   �� 5,       � �� �#FFFFFF6/   5-      �� 50      " ��6#   .�51      ��  � ��$ 14(�6-   �� 52       � ��$	 170��6*   �� 53       � ��
 ���� 6/   �� 54       � �� �#FDFEFE6/   �� 55       �@�FocusVisualStyle 65   Z� �� 56       � �� 57      �� 58      " ��6*   .R�59      �� #��z��6%   $ 25��6O   
�������$ 15q�6u   $��1q�6�   ._�5:   "   �� $��Center=�63   $��Center=�6P   5;      5<      5>      	 5?      P� 5@      
 �@J�IsMouseOver$
 True��65   . �5A      ��  � �� �#e8e8e867   �� 5B       � ��
 �iii�67   5C      P� 5D      
 �@J�IsMouseCaptured$
 True��69   . �5E      ��  � �� �#d9d9d967   �� 5F       � ��
 �iii�67   5G      5I      �� 5L      " ��6)   .�5M      ��  � ��
 ���� 6/   �� 5N       � ��$	 8 0q�6+   �� 5O       �@�FocusVisualStyle 65   Z� �� 5P       � �� 5Q      �� 5R      " ��6*   .R�5S      �� #��z��6%   $ 30��6O   ���#878787$ 15q�6w   $��1q�6�   ._�5T   "   �� $��Center=�63   $��Center=�6P   5U      5V      5X      	 5Y      P� 5Z      
 �@J�IsMouseOver$
 True��65   . �5[      ��  � �� �#d9d9d967   5\      P� 5]      
 �@J�IsMouseCaptured$
 True��69   . �5^      ��  � �� �#c4c4c467   5_      5a      �� 5f      " ��6%   .�5g      ��  � ��$ 30��6*   �� 5h       � ��$ 30��6+   �� 5i       � ��$	 Top=�66   �� 5j       � ��$ Right=�68   �� 5k       � ��$ 	0 13 13 0q�6+   	 5l      P� 5m      
 �@J�IsMouseOver$
 True��65   . �5n      ��  � z� 5o      �� 5p   "   $	 1.1Q�61   $	 1.1Q�6>   5r      5s      5u      �� 5x      " ��6%   .�5y      ��  � ��$ 14(�6-   �� 5z       � ��$ 1��60   �� 5{       �@K�ZIndex$ 1��61   �� 5|       � ��$ 10 0 0 0q�6+   �� 5}       � �� �#ACB0AF6/   5~      �� 5�      " ��6$   .�5�      ��  � ��$ 14(�6-   �� 5�       � ��$ 1��60   �� 5�       � ��$ 10 0 0 0q�6+   �� 5�       � �� �#8787876/   �� 5�       � ��
 ���� 60   �� 5�       � ��$ 0q�64   5�      �� 5�      " [�62   .�5�      ��  � �� 5�      �� 5�      " [�6*   .R�5�      �� #��z��6/   5�      5�      5�      �� 5�      " ��6'   .�5�      ��  � ��$ 14(�6-   �� 5�       � ��$ 0 20 0 0q�6+   �� 5�       � ��$	 200��6*   �� 5�       � �� �	#FF4285F46/   �� 5�       � �� �#FDFEFE6/   �� 5�       �@�FocusVisualStyle 65   Z� �� 5�       � �� 5�      �� 5�      " ��6*   .R�5�      �� #��z��6%   $ 25��6O   ���	#FF4285F4$ 15q�6y   $��1q�6�   ._�5�   "   �� $��Center=�63   $��Center=�6P   5�      5�      5�      	 5�      P� 5�      
 �@J�IsMouseOver$
 True��65   . �5�      ��  � �� �#3F7FDB67   �� 5�       � ��
 �����67   5�      P� 5�      
 �@J�IsMouseCaptured$
 True��69   . �5�      ��  � �� �#2C5FB367   �� 5�       � ��
 �����67   5�      5�      �� 5�      " ��6-   .�5�      ��  � �� 5�      �� 5�      " ��6*   .R�5�      �� #��z��6%   #��z��5�      $��0q�5�      $ 10��5�      ._�5�   "   �� $��Center=�63   $��Center=�5�   '   5�      5�      5�      5�      �� 5�      " ��6   .�5�      ��  � ��$
 Bold"�6/   �� 5�       � �� �#6666666/   �� 5�       � ��$ 30��6+   	 5�      P� 5�      
 �@��
IsSelected$
 True��64   . �5�      ��  � �� �#6633CC67   �� 5�       � ��$
 Bold"�67   5�      5�      �� 5�      " �6   .�5�      ��  � �� �#8AC9DF6/   �� 5�       � �� �#E8F3F66/   5�      �� 5�      " ��6   .�5�      ��  � �� 5�      �� 5�      " ��6*   .R�5�      �� $ 4��6%   ._�5�   "   �� $��Center=�63   $��Center=�5�   3   5�      5�      5�      5�      �� 5�      " ��6.   .�5�      ��  � �� �	#FF4285F46/   �� 5�       � ��
 �����6/   �� 5�       � ��$ 0q�64   �� 5�       � ��$
 10,5q�6,   �� 5�       � ��$ SemiBold"�6/   �� 5�       �@�Cursor$
 Hand��6+   �� 5�       � �� 5�      �� 5�      " ��6*   .R�5�      �� #��z��6%   $ 4��5�      ._�5�   "   �� $��Center=�63   $��Center=�5�   +   5�      5�      5�      	 5�      P� 5�      
 �@J�IsMouseOver$
 True��65   . �5�      ��  � �� �#3F7FDB67   5�      P� 5�      
 � ��$
 True��63   . �5�      ��  � �� �#2C5FB367   5      5     �� 5     " d�63   .�5     ��  � ��$ 0q�64   �� 5      � ��
 ���� 6/   �� 5      �@�FocusVisualStyle 65   Z� �� 5      � �� 5	     �� 5
     " d�6*   .R�5     �� 
������ ._�5  "   �� $
��Left=�63   $��Center=�5  +   5     5     5     5     �� 5     " ��6   .�5     ��  � ��$	 100��6*   �� 5      � �� �	#FF4285F46/   �� 5      � ��
 �����6/   �� 5      � �� �#CCCCCC64   �� 5      � ��$ 1q�68   �� 5      � ��$
 10,5q�60   �� 5      � ��$ 0,0,10,0q�6/   �� 5      � ��$ Medium"�63   �� 5      �@�Cursor$
 Hand��6/   �� 5      � �� 5      �� 5!     " ��6.   .R�5"  "   �� $ border��6)   $ 6��5#     #��z��5$     #��z��5%     #��z��5&     ._�5'  &   �� $��Center=�67   $��Center=�6T   5(  #    5)  "   P� 5+  "   
 �@J�IsMouseOver$
 True��6A   . �5,  &   �� $ border��6-    � �� �#7777776X   5-  #   P� 5/  &   
 � ��$
 True��6C   . �50  *   �� $ border��61    � �� �#7777776\   51  '   53     55     56     �� 59     " ��6   8   .�5:     ��  � �� �#4CAF5063   �� 5;      � ��$ 50��6*   �� 5<      � ��$ 25��6+   �� 5=      � ��
 �����6/   �� 5>      � �� �#45A04964   �� 5?      � ��$ SemiBold"�63   	 5@     P� 5A     
 �@J�IsMouseOver$
 True��69   . �5B     ��  � �� �#43A0476;   �� 5C      � �� �#3D8B406<   5D     P� 5E     
 � ��$
 True��67   . �5F     ��  � �� �#3D8B406;   �� 5G      � �� �#367B396<   5H     5J     �� 5M     " ��6   8   .�5N     ��  � ��$ 50��6*   �� 5O      � �� �#F443366/   �� 5P      � ��
 �����63   �� 5Q      � �� �#D32F2F64   	 5R     P� 5S     
 �@J�IsMouseOver$
 True��69   . �5T     ��  � �� �#E539356;   �� 5U      � �� �#C628286<   5V     P� 5W     
 � ��$
 True��67   . �5X     ��  � �� �#D32F2F6;   �� 5Y      � �� �#B71C1C6<   5Z     5\     �� 5_     " ��61   .�5`     ��  �@J�SnapsToDevicePixels$
 True��68   �� 5a      �@�OverridesDefaultStyle$
 True��6:   �� 5b      � ��$
 Auto=�6O   �� 5c      � ��$
 Auto=�6M   �� 5d      � ��$	 120��6-   �� 5e      � ��$ 30��6.   �� 5f      � �� 5g     �� 5h     " ��6*   .R�5i     � .+�5k  "   �� $ 
MainBorder��6)   #��z��5l     #��z��5m     #��z��5n     $ 8��5o     ._�5p  &   � .+�5r  *   �� 
������ $��0q�5s  %   $��Stretch=�5t  %   $��Stretch=�5u  %   $|�False��5v  %   $ Press=�5w  %   $
 Hand��5x  %   $
 True��5y  %   $ 点击展开��5z  %    5{  .   :� 5|  2   $ Button.Click��6?   .[�5}  6   �� ��5~  :   �� 5  >   .��5�  B   �� $ (ComboBox.IsDropDownOpen)�6a   $ 0:0:0D�5�  T   $ HoldEnd=�5�  T   .p�5�  F   s� $
 True��6^   $ 0:0:0��6k   5�  C   5�  ?   5�  7   5�  3   5�  +   �� 5�  *   $ ContentSite��6;   $ False��5�  /   #��z 5�  /   #��z 5�  /   #��z��5�  /   $��Center=�5�  /   $
��Left=�5�  /   5�  '   5�  #   � 5�  "   $  
PART_Popup��6(   $��Bottom=�5�     #��z! 5�     $
" True��5�     $|�False��5�     $# False��5�     .��5�  &   �� $ DropDownBorder��6-   
�������#��z��5�  !   #��z��5�  !   $ 8��5�  !   $��0,5,0,0q�5�  !   ._�5�  *   �� #��z$ 67   .��5�  .   �� 5�  +   5�  '   5�  #   5�      5�     P� 5�  "   
 �@J�IsMouseOver$
 True��6A   . �5�  &   �� $ 
MainBorder��6-    � �� �#5556\   5�  #   P� 5�  "   
 �@��IsDropDownOpen$
 True��6D   . �5�  &   �� $ 
MainBorder��6-    � �� �#3336\   5�  #   5�     5�     5�     �� 5�     " d�60   .�5�     ��  � ��
 �   �6/   �� 5�      � ��$ 16(�6-   �� 5�      � ��$
 0,10q�6+   �� 5�      � �� 5�     �� 5�     " d�6*   .R�5�     �� 
������ $
 Hand��6>   ._�5�  "   �� $% 
Horizontal=�6-   $��Center=�6F   .+�5�  &   � $��22��6+   $��22��66   $��0,0,10,0q�6B   .+�5�  *   A� $& OuterCircle��62   ���#CCCCCC$��2��6X   
������ 6l   A� 5�  *   $& InnerCircle��62   $��8��6G   $��8��6Q   ���#409EFF$' 0Q�6k   $( 0.5,0.5&�6w   z�5�  .   �� 5�  2   $ 0Q�6A   $ 0Q�6L   5�  +   5�  '   �� 5�  &   $��Center=�67   5�  #   5�      5�     P� 5�  "   
 �@J�IsMouseOver$
 True��6A   . �5�  &   ��  � �� �#409EFF6C   5�  #   P� 5�  "   
 �@d�	IsChecked$
 TrueY�6?   ) 5�  &   �� 5�  *   .��5�  .   �� .��5�  2   W� $* InnerCircle��6B   $ Opacity�5�  :   + 15�  :   $ 0:0:0.2D�6A   W� 5�  2   $* InnerCircle��6B   $- 'RenderTransform.(ScaleTransform.ScaleX)�5�  :   + 15�  :   $ 0:0:0.2D�6A   8,   5�  :   W� 5�  2   $* InnerCircle��6B   $- 'RenderTransform.(ScaleTransform.ScaleY)�5�  :   + 15�  :   $ 0:0:0.2D�6A   8,  5�  :   5�  /   5�  +   - 5�  &   �� 5�  *   .��5�  .   �� .��5�  2   W� $* InnerCircle��6B   $ Opacity�5�  :   + 05�  :   $ 0:0:0.2D�6A   W� 5�  2   $* InnerCircle��6B   $- 'RenderTransform.(ScaleTransform.ScaleX)�5�  :   + 05�  :   $ 0:0:0.2D�6A   8,  5�  :   W� 5�  2   $* InnerCircle��6B   $- 'RenderTransform.(ScaleTransform.ScaleY)�5�  :   + 05�  :   $ 0:0:0.2D�6A   8,  5�  :   5�  /   5�  +   5�  #   5�     5     5       5     $. EaseOut=�6,   5     5     