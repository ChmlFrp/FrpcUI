   M S B A M L   `   `   `  ���� A  =FrpcUI, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:FrpcUI.ClassFrpcUI.Class  +clr-namespace:FrpcUI.ClassFrpcUI.Class      FrpcUI.Pages.HomePage   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     U QWpfAnimatedGif, Version=2.0.0.0, Culture=neutral, PublicKeyToken=9e7cd3b544a090dc/wpfgif"http://wpfanimatedgif.codeplex.com  &localclr-namespace:FrpcUI.Class  +
convertersclr-namespace:FrpcUI.Class     SecundaryBackgroundColor  N� 
Background#  �    N� 
FontFamily$ Microsoft YaHei)�.��� $��20q� � ColumnDefinitions �� $��3* ��� $��2* �.+��� $��0��$��	10,0,20,0q�.+��� $��欢迎��$��20(�$
��Bold"�$��0,0,0,0q�� $��Stretch=�$	��Top=�$��20q� � RowDefinitions �� $
��auto ��� $
��Auto ��� $
��Auto ��� $��* �.+��� -    ��Name$ nodeComboBox��$	��300��$��10,0,0,0q�$��Center=�  RoundedComboBoxStyle#��[ ���#E6F3FF���#cfe2f3���#cfe2f3$��1q�$
��Left=����� *
IniFiles+ �� SelectedItem �� *SelectedIniFile+ �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=����� .R��� ���#333333$��14(�$	��3,0q����� �� -   $��	180,0,0,0q�����  �� 
TargetType" ��.R��� 	 ��Name$	 border��
 �� CornerRadius$
 10��
������ $��27��$��Center=�$��Center=�._���  �� Orientation$ 
Horizontal=�$��Center=�$��Center=�.+�F� ����� � ��[ � � @T� � $� @KL � � @B � �  	= � 	=  �   z  z � 	= �� �D �V� ��O ��(\�B0@��;f ��� �^_ P*� ��[ @]� ��[  � � � ��[ ���[ ��[ �@A`v � ��a� ���2� ���ا �� � � � �����[ ��[ � � ��� � z ��!� � ��^� �  -1� -1 �   z  z � -10&�  (*߈ @A`v 	
���   � �� Stretch$ Uniform=�$��20��$��20�� �� Triggers P�  P� Property �@J�IsMouseOver P� Value$
 True��. ���  �� Property �@�Cursor �� Value$
 Hand��P�  � ��$
 True��. ���  �� 
TargetName$ border�� � �� �#E0E0E0�� -    ��Name$ 
EditButton��$	��120��$��40��
������ 
������ ���#673AB7$
��Bold"�$��	356,0,0,0q�$	��Top=�$
��Left=�����  �� 
TargetType" ��.���  � �� �� " ��.R��� $	 border��#��z��#��z��#��z��$
 4�� J� SnapsToDevicePixels$
 True��._���  ��Name$ contentPresenter��#��z��#��z��$	��8,0q�$��Center=�$��Center=� P�  �@J�IsMouseOver$
 True��. ���  �@�Cursor$
 Hand���� $ border�� � �� �#F5F5F5�� $ contentPresenter�� � �� �#5E35B1�� $ contentPresenter�� � �� �#5E35B1P�  � ��$
 True��. ��� $ border�� � �� �#E0E0E0�� $ border�� � z� ��  �� ScaleX$
 0.98Q� �� ScaleY$
 0.98Q��� $ border�� �@J�RenderTransformOrigin$ 0.5,0.5&�P�  � {�$ False��. ���  �@J�Opacity$	 0.6Q�.���� $ 
Horizontal=�$��Center=�.+�F�   play#���  $��20��$��20��$ Uniform=�$��0,0,8,0q����� *
Foreground+ �� RelativeSource ��  �� AncestorType
 Button�� $��运行��$��Center=�$��14(�$��SemiBold"�� $��3��$	��250��.+��� $��3��$
 10��#���    �� Padding$ 10q�
������ $��0,10,0,0q�$	��250��._��� $��Disabled=�$��Disabled=� �� PanningMode$ VerticalOnly=�.���� -    ��Name$ 	cmdOutput��$�� �����#424242$��14(�
������ $��0q� �� 
IsReadOnly$
 True�� �� TextWrapping$
 Wrap=�  �� AcceptsReturn$
  True��$	��Top=�$��Stretch=��� -   ! ��Name$! 
LoadingGif��$��40��$��40��$��Center=�$��Center=�$y�	Collapsed=�"  WpfAnimatedGif.ImageBehavior"   AnimatedSource$" /Images/loading.gif���� $��账户设置��$��16(�$��SemiBold"�$��0,5,0,20q�A� # A� Columns$# 2��$��	10,0,0,40q�.+��� $ 
Horizontal=�$��10q�.+�F�   key#���  $��24��$��24�����#D1C4E9�� $��重置Token��$��Center=�$
��10,0q��� $ 
Horizontal=�$��10q�.+�F�   user#���  $��24��$��24�����#FFCDD2�� $��修改用户名��$��Center=�$
��10,0q��� $ 
Horizontal=�$��10q�.+�F�   	userimage#���  $��24��$��24�����#C8E6C9�� $��更改头像��$��Center=�$
��10,0q��� $ 
Horizontal=�$��10q�.+�F�   password#���  $��24��$��24�����#FFE0B2�� $��修改密码��$��Center=�$
��10,0q��� $ 
Horizontal=�$��10q�.+�F�  	 email#���  $��24��$��24�����#BBDEFB�� $��更改邮箱��$��Center=�$
��10,0q��� $ 
Horizontal=�$��10q�.+�F�   qq#���  $��24��$��24�����#BDBDBD�� $��更改QQ号��$��Center=�$
��10,0q��� $��1��$��20,0,0,0q�.+��� $��使用兑换码��$��16(�$��SemiBold"�$��0,55,0,4q��� $ 
Horizontal=�$��0,0,0,20q�.+��� $	��200��$��35��$
 10��$��0,0,10,0q����#F5F5F5$ J� Opacity$	$ 0.4Q�._��� $
��Auto��$
��Auto��$��还在开发中~��$��0q�
������ ���#424242$��14(�$
 True��$��Center=��� $��兑换��$��50��$��25�����#8E54E5���#E0E0E0$
��80,8q����#F5F5F5���� " ��.R��� $	 border��$
 5��#��z��#��z��$��1q�._��� $��Center=�$��Center=� P�  �@J�IsMouseOver$
 True��. ���  �@�Cursor$
 Hand���� $ border�� � �� �#6633CCP�  � ��$
 True��. ��� $ border�� � �� �#6633CCP�  � {�$ False��. ��� $ border�� � �� �#EEEEEE�� $ border�� � �� �#E0E0E0��  � �� �#9E9E9E�� ���� *
HomeModels+���� .R��� $
 10��
�������$ 20q����#E0E0E0$��1q�._��  �� $
��Auto ��� $��* �.+��� $��0��$ 
Horizontal=�$��Center=�$��0,0,0,10q�.+��� $	��0,0q�.+��� $
��Bold"�$��16(����� *Name+�� $��12(�$��0,10,0,0q�$��Center=����#757575���� *Mail+� $��1��$
��0,10q� �� $��2* ��� $��3* �.+��� $��0��$��20q�.+��� $��注册时间�����#757575$
��0,10q��� $��到期时间�����#757575$
��0,10q��� $��隧道限制�����#757575$
��0,10q��� $��国内带宽�����#757575$
��0,10q��� $��实名状态�����#757575$
��0,10q��� $��剩余积分�����#757575$
��0,10q��� $��1��$��20q�.+��� $
��0,10q����� *	DateOut+% �� StringFormat$% 
yyyy-MM-dd���� $��
9999-99-99��$
��0,10q��� $
��0,10q����� *Tunnel+�� $
��0,10q����� *	Bandwidth+�� $
��0,10q����� *
RealName+�� $
��0,10q����� *
Integral+�� $��3��$	��Top=�$��Center=�$��0,250q�$
��Auto��.+��� & ��Name$& token��-   $
��Auto��$
��Wrap=�$y�	Collapsed=����� *Token+' � ToolTip' _� $��点击进行复制��( ^� InitialShowDelay$	( 200��) ^� BetweenShowDelay$) 0��* ^� ShowDuration$* 60000���� -   $��4��$��点击显示Token��
������ 
������ ���#9C27B0$��0q�$��	0,280,0,0q�$	��Top=����� " ��.R��� $	 border��$
 5��#��z��#��z��$��1q�._��� $��Center=�$��Center=� P�  �@J�IsMouseOver$
 True��. ���  �@�Cursor$
 Hand��