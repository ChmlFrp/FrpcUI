   M S B A M L   `   `   `  ���� A  =FrpcUI, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:FrpcUI.ClassFrpcUI.Class      FrpcUI.Tianjiasuidao   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     1
convertersclr-namespace:FrpcUI.Class       � Title$  节点列表�� � 	Resources %   FrpcUI.Class.WebToTextConverter   WebToTextConverter*   $FrpcUI.Class.WebToTextColorConverter  WebToTextColorConverter&    FrpcUI.Class.WebToColorConverter  WebToColorConverter �� 
TargetType  ModernButtonStyle �� BasedOn �� Property �� Value��%�   &	        &	      &	 
     '��      7        �� " ��8   .���  � ��$ 70����  � ��$ 20����  � ��$ 5q�.��� $��Center=� � RowDefinitions �� $
��Auto ��� $
��Auto ��� $��* �.+�� .+��� $��10q����#666$��14(�JH为确保您的体验，请尽量选择负载低，距离近的节点。� $��1��$��
10,5,10,10q� � ColumnDefinitions �� $
��Auto ��� $
��Auto ��� $��* ��� $
��Auto �.+���  �� Orientation$ 
Horizontal=�$��12,0,0,0q�$��0��$��Center=�.+��� $	��UDP��$��5q��� $	��VIP��$��5q��� $ 
Horizontal=�$��2��$��Right=�.+��� $��全部��$��70��$��25��$��5q����#8E54E5
��������� $��	可建站��$��70��$��25��$��5q��� $��不可建站��$��70��$��25��$��5q��� $��全部��$��70��$��25��$��5q��� $��境内��$��70��$��25��$��5q����#8E54E5
�������#��[ �� $��境外��$��70��$��25��$��5,0,20,0q��� $��2��$��10q�$��Hidden=�.���� ���� *Datums+���� .R�� 	 � Orientation$	 
Horizontal=����� .R��� $	��250��$��14q�
 �� Padding$
 10q����#E0E0E0$��1q� �� CornerRadius$ 8�����#fff._��  �� $��* �.+��� $ Vertical=�.+��� $ 
Horizontal=�.+��� $��18��$��Center=����#8E8E8E$��14(�$��0,0,0,0q����� *Id+�� $	��120��$��Center=�$��14(�$��10,0,0,0q����� *Name+�� $��35��$��Right=�$ 10��$��40,0,0,0q����� *	Nodegroup+ �� 	Converter# [ ._��� $��10(�$��5,5,5,5q�$��Center=����� *	Nodegroup+# [  ���� *	Nodegroup+# [ �� $ 
Horizontal=�.+��� $
��Auto��$��50��$
��Left=�$ 10��$��	25,10,0,0q����� *Web+# [ ._��� $��10(�$��5,5,5,5q����� *Web+# [  ���� *Web+# [ �� -   $��	0,-23,5,5q�$��23�����#2080f0���#cfe2f3$��Right=�$��35��$��选择��  RoundButtonStyle#��[ ����  �� 
TargetType" ��.R���  ��Name$ border��$ 10��#��z��$��1q�._��� $��Center=�$��Center=� �� Triggers P�  P� Property �@J�IsMouseOver P� Value$
 True��. ���  �@�Cursor$
 Hand����  �� 
TargetName$ border�� � �� �#cfe2f3�� $ border�� � �� �#2080f0P�  � ��$
 True��. ��� $ border�� � �� �#cfe2f3�� $ border�� � �� �#2080f0P�  � {�$ False��. ��� $ border�� � �� �#FFCDD2�� $ border�� � �� �#EF9A9A��  � �� �#E0E0E0