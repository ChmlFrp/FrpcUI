   M S B A M L   `   `   `  ���� A  =FrpcUI, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:FrpcUI.WindowsFrpcUI.Windows  #    FrpcUI.Windows.Tianjiasuidao2   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     .localclr-namespace:FrpcUI.Windows       � Title$  节点详情��.���� $��10q� �� CornerRadius$ 8��
�������$��1q����	#FFE0E0E0._�� $��15q� � 	Resources  �� 
TargetType   
LabelStyle �� Property �� Value  
ValueStyle3  -System.Windows.Media.Effects.DropShadowEffect  ShadowEffect   
BlurRadius   ShadowDepth   Opacity	   Color��%�  &	        &	 z     '�� �     &	 =    �� " ��.���  � ��$ Center=���  � ��$ 20,20q���  � ��$ SemiBold"���  � �� �	#FF555555�� " ��.���  � ��$ Center=���  � ��$	 8,6q���  � �� �	#FF333333��  � ��$ CharacterEllipsis=��� " ��.���  � �� �	#FFEEEEEE��  � ��$	 0,5q�  $ 10Q�$ 2Q�$	 0.1Q�$	 Black��.+��� $��0�����	#FF4285F4$ 5,5,0,0��$��40��$	��Top=�._��� 
�������$��16(�$��Center=�$
��15,0q�$
��Bold"����� *Name+� $��0,40,0,0q�
 � ColumnDefinitions
 �� $
��Auto ��� $��* ��� $
��Auto ��� $��* ��� $
��Auto ��� $��* � � RowDefinitions �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto �.+��� $��0��$��0��$��节点名：��#��[  �� $��0��$��1��#��[ ���� *NodeProperties[0].Value+�� $��0��$��2��$��	地区：��#��[  �� $��0��$��3��#��[ ���� *NodeProperties[1].Value+�� $��0��$��4��$��权限组：��#��[  �� $��0��$��5��#��[ ���� *NodeProperties[2].Value+�� $��0��$��6��$��Bottom=��� $��1��$��0��$��	防御：��#��[  �� $��1��$��1��#��[ ���� *NodeProperties[3].Value+�� $��1��$��2��$��	建站：��#��[  �� -    ��Name$ jianzhan��$��1��$��3��#��[ ���� *NodeProperties[4].Value+�� $��1��$��4��$��UDP：��#��[  �� $��1��$��5��#��[ ���� *NodeProperties[5].Value+�� $��2��$��0��$��域名过白：��#��[  �� $��2��$��1��#��[ ���� *NodeProperties[6].Value+�� $��2��$��2��$��端口限制：��#��[  �� $��2��$��3��#��[ ���� *NodeProperties[7].Value+�� $��2��$��4��$��	域名：��#��[  �� $��2��$��5��#��[ ���� *NodeProperties[8].Value+�� $��3��$��0��$��IP：��#��[  �� $��3��$��1��#��[ ���� *NodeProperties[9].Value+�� $��3��$��2��$��IPv6：��#��[  �� $��3��$��3��#��[ ���� *NodeProperties[10].Value+�� $��3��$��4��$��	带宽：��#��[  �� $��3��$��5��#��[ ���� *NodeProperties[11].Value+�� $��4��$��0��$��	介绍：��#��[  �� $��4��$��1��$��5��#��[ $
��Wrap=�$	��8,6q����� *NodeProperties[12].Value+�� $��30�� �� Orientation$ 
Horizontal=�$��Right=�$��	0,350,0,0q�.+��� -   $��取消��$��80��$��0,0,10,0q�  ModernButtonStyle#��[ �� -   $��	上一步��$��80��$��0,0,10,0q�#��[ �� -   $��继续��$��80��#��[ 