   M S B A M L   `   `   `  ���� A  =FrpcUI, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:FrpcUI.ClassFrpcUI.Class  +clr-namespace:FrpcUI.ClassFrpcUI.Class      FrpcUI.Pages.SuiDaoPage   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     ,localclr-namespace:FrpcUI.Class     1
convertersclr-namespace:FrpcUI.Class       � 	Resources  )   #FrpcUI.Class.StatusToColorConverter   StatusToColorConverter-   'FrpcUI.Class.StatusToTextColorConverter  StatusToTextColorConverter(   "FrpcUI.Class.StatusToTextConverter  StatusToTextConverter��%-   &	        &	      &	 
           .��� ���#F4F5F7$��20q�.+��� $��0,0,0,20q�.+��� $��隧道列表��$��20(�$
��Bold"�$��0,0,0,20q�]� $��Right=�.+��� -   $��刷新��$��80��$��25�����#FFFFFF���#E0E0E0$	��6,2q�$��0,0,10,0q����#333333����  �� 
TargetType" ��.R���  ��Name$ border�� �� CornerRadius$ 5��#��z��#��z��$��1q�._��� $��Center=�$��Center=� �� Triggers P�  P� Property �@J�IsMouseOver P� Value$
 True��. ���  �� Property �@�Cursor �� Value$
 Hand���� 	 �� 
TargetName$	 border�� � �� �#F5F5F5�� $	 border�� � �� �#BDBDBDP�  � ��$
 True��. ��� $	 border�� � �� �#E0E0E0�� $	 border�� � �� �#9E9E9EP�  � {�$ False��. ��� $	 border�� � �� �#EEEEEE�� $	 border�� � �� �#E0E0E0��  � �� �#9E9E9E�� -   $��添加隧道��$��80��$��25�����#4CAF50
�������$	��6,2q����� " ��.R��� $ border��$ 5��#��z��#��z��$��1q�._��� $��Center=�$��Center=� P�  �@J�IsMouseOver$
 True��. ���  �@�Cursor$
 Hand���� $	 border�� � �� �#43A047�� $	 border�� � �� �#2E7D32P�  � ��$
 True��. ��� $	 border�� � �� �#2E7D32�� $	 border�� � �� �#1B5E20P�  � {�$ False��. ��� $	 border�� � �� �#A5D6A7�� $	 border�� � �� �#81C784��  � �� �#E8F5E9�� -   
 ��Name$
 scrollViewer��$
��Auto=�$��0,80,0,0q�.���� ���� *SuidaoModels+���� .R��  � Orientation$ 
Horizontal=�$
��Left=�$
��Auto������ .R��� 
�������$ 8�����#E0E0E0$��1q�$��
0,20,14,10q�$	��220��._��� $��15q�.+�� $��Center=�$��0,0,0,8q� � ColumnDefinitions �� $
��Auto ��� $
��Auto ��� $��* ��� $
��Auto �.+��� $
��Bold"�$��14(�$��0,0,5,0q�$��0������ *Name+�� ���#999999$��1��$��Center=����� *ID+�� $��30��$ 4��$��3��$��0,0,3,0q����� *	NodeState+ �� 	Converter# [  ._��� $��12(�$��Center=����� *	NodeState+# [ ���� *	NodeState+# [ �� $��12(����#9C27B0$��0,0,0,2q����� *Node+�� $��12(����#9C27B0$��0,0,0,6q��� ��� *	LocalIP+ �� $�:�� �� ��� *NPort+ �� $�-�� �� ��� *Type+�� -   $��12(����#333333$��0,0,0,6q����� *
ConnectUrl+ � ToolTip _� $��点击进行复制���� $��10(����#999999$��Bottom=����� *Uptime+ �� StringFormat$ yyyy-MM-dd HH:mm:ss�� �� TargetNullValue$ 	未启动���� $��0,8,0,0q�.+���  �� Orientation$ 
Horizontal=�$��Center=�.+��� $	��↓��$��12(�$��0,0,5,0q��� $��12(�$��0,0,5,0q����� *TodayTrafficIn+�� $��Bytes��$��12(�$��0,0,10,0q��� $	��↑��$��12(�$��0,0,5,0q��� $��12(�$��0,0,5,0q����� *TodayTrafficOut+�� $��Bytes��$��12(�$��0,0,10,0q��� $��连接数：��$��12(�$��0,0,0,0q��� $��12(����� *
CurConns+�� $ 
Horizontal=�$��Center=�.+��� $��编辑��$��50��$��25�����#FFFFFF���#E0E0E0$	��8,8q����#333333���� " ��.R��� $ border��$ 5��#��z��#��z��$��1q�._��� $��Center=�$��Center=� P�  �@J�IsMouseOver$
 True��. ��� $	 border�� � �� �#F5F5F5�� $	 border�� � �� �#BDBDBDP�  � ��$
 True��. ��� $	 border�� � �� �#E0E0E0�� $	 border�� � �� �#9E9E9EP�  � {�$ False��. ��� $	 border�� � �� �#EEEEEE�� $	 border�� � �� �#E0E0E0��  � �� �#9E9E9E�� $��查看��$��50��$��25�����#FFFFFF���#E0E0E0$	��8,8q����#333333���� " ��.R��� $ border��$ 5��#��z��#��z��$��1q�._��� $��Center=�$��Center=� P�  �@J�IsMouseOver$
 True��. ��� $	 border�� � �� �#F5F5F5�� $	 border�� � �� �#BDBDBDP�  � ��$
 True��. ��� $	 border�� � �� �#E0E0E0�� $	 border�� � �� �#9E9E9EP�  � {�$ False��. ��� $	 border�� � �� �#EEEEEE�� $	 border�� � �� �#E0E0E0��  � �� �#9E9E9E�� -   $��删除��$��50��$��25�����#FF5252���#D32F2F$	��8,8q�
����������� " ��.R��� $ border��$ 5��#��z��#��z��$��1q�._��� $��Center=�$��Center=� P�  �@J�IsMouseOver$
 True��. ���  �@�Cursor$
 Hand���� $	 border�� � �� �#E53935�� $	 border�� � �� �#C62828P�  � ��$
 True��. ��� $	 border�� � �� �#C62828�� $	 border�� � �� �#B71C1CP�  � {�$ False��. ��� $	 border�� � �� �#FFCDD2�� $	 border�� � �� �#EF9A9A��  � �� �#E0E0E0� -    �Name$ conrect_Grid��$	��140��