   M S B A M L   `   `   `  ���� A  =FrpcUI, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:FrpcUIFrpcUI      
FrpcUI.App   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     &localclr-namespace:FrpcUI       �� 	Resources   �� MergedDictionaries �� Source �� 
TargetType �� Property �� Value   	TitleText  
NormalText 
 button �� 
TargetType �� CornerRadius �� Padding	 �� Triggers
 P� Property P� Value  buttonCircle  imgClose �� ScaleX �� ScaleY  textHint  textBox  HiddenNavigationStyle  
mainButton 	 RoundButtonStyle 
 TabItemStyle  ProgressBarStyle  TextBox  ModernButtonStyle  BorderlessToggleButton  ModernButton ��Name �� Triggers �� 
TargetName  PrimaryButton �� BasedOn  DangerButton  RoundedComboBoxStyle � ColumnDefinitions ��Name �� SelectionBoxItem �� SelectionBoxItemTemplate � 	Resources d�Name �� 	ClickMode d� 	IsChecked �� Mode �� RelativeSource F�Name �Name �� IsDropDownOpen � AllowsTransparency  � 	StaysOpen! �� MaxDropDownHeight  AnimatedRadioButton" � Cursor# �� Orientation$ A�Name% J� Opacity& J� RenderTransformOrigin' N� EnterActions( �� 
TargetName) �� TargetProperty	* W� To+ g� Duration  EaseOut, W� EasingFunction- N� ExitActions2  ,System.Windows.Media.Animation.QuadraticEase7  1System.Windows.Media.Animation.EasingFunctionBase.   
EasingMode��  �� $ Themes/LightTheme.xaml?��� $ Assets/Icons/Icons.xaml?��� $ Styles/MainStyle.xaml?�%�  '�       &	  �     &	 !    &	 �    &	 �    &	 �    &	 �    &	 R    &	 �    &	 &    &		 	    &	
 �	    &	 8
    &	 }
    &	 �
    &	 T    &	     &	     7  &	 b    7  &	 �    &	 �    7  7  7  7  &	 �    �� " �.���  �@�OverridesDefaultStyle$
 True����  �@�AllowsTransparency$
 True����  �@�WindowStyle$
 None=���  � ��
 ���� �� " ��.���  � ��$ 36(���  � ��$
 Bold"���  �@��TextAlignment$ Center=���  � �� �#FFFFFF�� " ��.���  � ��$ 16(���  �@��
LineHeight$ 28����  � ��$
 Wrap=���  �@��TextAlignment$ Center=���  � �� �#FFFFFF�� " ��.���  � ��$ 14(���  � ��$	 170����  � ��
 ���� ��  � �� �#FDFEFE��  �@�FocusVisualStyle Z� ��  � �� �� " ��.R��� #��z��$ 25��
�������$ 15q�$��1q�._��� $��Center=�$��Center=�	 P� 
 �@J�IsMouseOver$
 True��. ���  � �� �#e8e8e8��  � ��
 �iii�P� 
 �@J�IsMouseCaptured$
 True��. ���  � �� �#d9d9d9��  � ��
 �iii��� " ��.���  � ��
 ���� ��  � ��$	 8 0q���  �@�FocusVisualStyle Z� ��  � �� �� " ��.R��� #��z��$ 30�����#878787$ 15q�$��1q�._��� $��Center=�$��Center=�	 P� 
 �@J�IsMouseOver$
 True��. ���  � �� �#d9d9d9P� 
 �@J�IsMouseCaptured$
 True��. ���  � �� �#c4c4c4�� " ��.���  � ��$ 30����  � ��$ 30����  � ��$	 Top=���  � ��$ Right=���  � ��$ 	0 13 13 0q�	 P� 
 �@J�IsMouseOver$
 True��. ���  � z� �� $	 1.1Q�$	 1.1Q��� " ��.���  � ��$ 14(���  � ��$ 1����  �@K�ZIndex$ 1����  � ��$ 10 0 0 0q���  � �� �#ACB0AF�� " ��.���  � ��$ 14(���  � ��$ 1����  � ��$ 10 0 0 0q���  � �� �#878787��  � ��
 ���� ��  � ��$ 0q��� " [�.���  � �� �� " [�.R��� #��z���� " ��.���  � ��$ 14(���  � ��$ 0 20 0 0q���  � ��$	 200����  � �� �	#FF4285F4��  � �� �#FDFEFE��  �@�FocusVisualStyle Z� ��  � �� �� " ��.R��� #��z��$ 25�����	#FF4285F4$ 15q�$��1q�._��� $��Center=�$��Center=�	 P� 
 �@J�IsMouseOver$
 True��. ���  � �� �#3F7FDB��  � ��
 �����P� 
 �@J�IsMouseCaptured$
 True��. ���  � �� �#2C5FB3��  � ��
 ������� " ��.���  � �� �� " ��.R��� #��z��#��z��$��0q�$ 10��._��� $��Center=�$��Center=��� " ��.���  � ��$
 Bold"���  � �� �#666666��  � ��$ 30��	 P� 
 �@��
IsSelected$
 True��. ���  � �� �#6633CC��  � ��$
 Bold"��� " �.���  � �� �#8AC9DF��  � �� �#E8F3F6�� " ��.���  � �� �� " ��.R��� $ 4��._��� $��Center=�$��Center=��� " ��.���  � �� �	#FF4285F4��  � ��
 �������  � ��$ 0q���  � ��$
 10,5q���  � ��$ SemiBold"���  �@�Cursor$
 Hand����  � �� �� " ��.R��� #��z��$ 4��._��� $��Center=�$��Center=�	 P� 
 �@J�IsMouseOver$
 True��. ���  � �� �#3F7FDBP� 
 � ��$
 True��. ���  � �� �#2C5FB3�� " d�.���  � ��$ 0q���  � ��
 ���� ��  �@�FocusVisualStyle Z� ��  � �� �� " d�.R��� 
������ ._��� $
��Left=�$��Center=��� " ��.���  � ��$	 100����  � �� �	#FF4285F4��  � ��
 �������  � �� �#CCCCCC��  � ��$ 1q���  � ��$
 10,5q���  � ��$ 0,0,10,0q���  � ��$ Medium"���  �@�Cursor$
 Hand����  � �� �� " ��.R��� $ border��$ 6��#��z��#��z��#��z��._��� $��Center=�$��Center=� P� 
 �@J�IsMouseOver$
 True��. ��� $ border�� � �� �#777777P� 
 � ��$
 True��. ��� $ border�� � �� �#777777�� " ��8   .���  � �� �#4CAF50��  � ��$ 50����  � ��$ 25����  � ��
 �������  � �� �#45A049��  � ��$ SemiBold"�	 P� 
 �@J�IsMouseOver$
 True��. ���  � �� �#43A047��  � �� �#3D8B40P� 
 � ��$
 True��. ���  � �� �#3D8B40��  � �� �#367B39�� " ��8   .���  � ��$ 50����  � �� �#F44336��  � ��
 �������  � �� �#D32F2F	 P� 
 �@J�IsMouseOver$
 True��. ���  � �� �#E53935��  � �� �#C62828P� 
 � ��$
 True��. ���  � �� �#D32F2F��  � �� �#B71C1C�� " ��.���  � �� �� " ��.R�� .+��� $ 
MainBorder��#��z��#��z��#��z��$ 8��� $��2q� �� $��* ��� $��20 �.+��� $ ContentSite��#��z #��z #��z��$��Stretch=�$��Center=� ���� '��       " ��.���  �@��CornerRadius$ 5��d� $ ToggleButton��$��1��$|�false��$ Press=� �� *IsDropDownOpen+$ TwoWay=� �� *TemplatedParent+���� " d�.R��� 
������ ._�F� $ Arrow�����#333333$��Center=�$��Center=�"����        � 	=  	= � z     	 P� 
 �@J�IsMouseOver$
 True��. ��� $ Arrow�� � �� �#2080f0� $ Popup��$��Bottom=�#��z $
 True��$
|�True��$  False��$��Slide=�.���� $ DropDownBorder��#��z��#��z��#��z��$ 8��$��0,5,0,0q�._��� #��z! .����  P� 
 �@J�IsMouseOver$
 True��. ���  �@�Cursor$
 Hand���� $ 
MainBorder�� � �� �#555555P� 
 �@��IsDropDownOpen$
 True��. ��� $ 
MainBorder�� � �� �#333333�� " d�.���  � ��
 �   ���  � ��$ 16(���  � ��$
 0,10q���  � �� �� " d�.R��� 
������ $
" Hand��._��� $# 
Horizontal=�$��Center=�.+�� $��22��$��22��$��0,0,10,0q�.+�A� $$ OuterCircle�����#CCCCCC$��2��
������ A� $$ InnerCircle��$��8��$��8�����#409EFF$% 0Q�$& 0.5,0.5&�z��� $ 0Q�$ 0Q��� $��Center=� P� 
 �@J�IsMouseOver$
 True��. ���  � �� �#409EFFP� 
 �@d�	IsChecked$
 TrueY�' �� .���� .��W� $( InnerCircle��$) Opacity�* 1$+ 0:0:0.2D�W� $( InnerCircle��$-) 'RenderTransform.(ScaleTransform.ScaleX)�* 1$+ 0:0:0.2D�8,   W� $( InnerCircle��$-) 'RenderTransform.(ScaleTransform.ScaleY)�* 1$+ 0:0:0.2D�8,  - �� .���� .��W� $( InnerCircle��$) Opacity�* 0$+ 0:0:0.2D�W� $( InnerCircle��$-) 'RenderTransform.(ScaleTransform.ScaleX)�* 0$+ 0:0:0.2D�8,  W� $( InnerCircle��$-) 'RenderTransform.(ScaleTransform.ScaleY)�* 0$+ 0:0:0.2D�8,    $. EaseOut=�