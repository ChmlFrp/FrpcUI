   M S B A M L   `   `   `  ���� 
  FrpcUI     FrpcUI.Pages.Peizhiwenjian   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008       N� Title$  
ConfigPage��.��� ���#F4F5F7$��20q�.+��� $��Center=�$	��910��.+��� $��配置文件��$��20(�$
��Bold"�$��0,0,0,20q�]� $��10q�$
��True��.+��� -    ��Name$ nodeComboBox��$	��180��$��	30,0,10,0q�$��Center=�   RoundedComboBoxStyle#��[  ���#E6F3FF���#cfe2f3���#cfe2f3$��1q����� *UniqueNodeModels+ �� SelectedItem �� *SelectedNode+ �� Mode$ TwoWay=����� .R���  ��Name$
 node�����#333333$��14(�$	��3,0q����� *Node+�� $	��300��$��35,0,0,0q�$��Center=�#��[  ���#E6F3FF���#cfe2f3���#cfe2f3$��1q����� *FilteredSuidaoModels+ �� *SelectedSuidao+$ TwoWay=����� .R��  � ColumnDefinitions �� $��* ��� $
��Auto �.+��� $ suidao�����#333333$��14(�$	��3,0q� � ToolTip$6 0为空代表选中当前节点下的全部隧道�� ^� InitialShowDelay$	 200�� ^� BetweenShowDelay$ 0��	 ^� ShowDuration$	 60000������ *Name+$ TwoWay=��� -   $��1��$	��❌��
������ $��0q�$	��5,0q�$��Center=����� 
 �� 
TargetType"
 ��.R���  ��Name$ border��#��z��#��z�� J� Opacity$ 0Q�._��� #��z��#��z�� �� Triggers P�  P� Property �@J�IsMouseOver P� Value$
 True��. ���  �� 
TargetName$ border�� �� Property �@J�Opacity �� Value$ 1Q��� $ border�� � �� �	#10000000��  �@�ToolTip$? 9清除隧道名代表选中当前节点下的全部隧道����  �� Orientation$ 
Horizontal=�.+��� -   $��0,0,75,0q����� "
 ��.R��� $ border�� �� CornerRadius$ 10��
������ $��27��$��Center=�$��Center=�._��� $ 
Horizontal=�$��Center=�$��Center=�.+�F� ����� � ��[ � � @T� � $� @KL � � @B � �  	= � 	=  �   z  z � 	= �� �D �V� ��O ��(\�B0@��;f ��� �^_ P*� ��[ @]� ��[  � � � ��[ ���[ ��[ �@A`v � ��a� ���2� ���ا �� � � � �����[ ��[ � � ��� � z ��!� � ��^� �  -1� -1 �   z  z � -10&�  (*߈ @A`v 	
���   � �� Stretch$ Uniform=�$��20��$��20�� P�  �@J�IsMouseOver$
 True��. ���  �@�Cursor$
 Hand��P�  � ��$
 True��. ��� $ border�� � �� �#E0E0E0�� $��生成��$	��100��$��30��$��5q�$��0,0,10,0q����#2080f0
�������$��0q����� *ShenchengCommand+���� "
 ��.R��� $ border��$ 10��#��z��$��1q�._��� $��Center=�$��Center=� P�  �@J�IsMouseOver$
 True��. ���  �@�Cursor$
 Hand���� $ border�� � �� �#2080f0P�  � ��$
 True��. ��� $ border�� � �� �#2080f0�� -   $��写入��$	��100��$��30��$��5q�$��	10,0,10,0q����#2080f0
�������$��0q����� "
 ��.R��� $ border��$ 10��#��z��$��1q�._��� $��Center=�$��Center=� P�  �@J�IsMouseOver$
 True��. ���  �@�Cursor$
 Hand���� $ border�� � �� �#2080f0P�  � ��$
 True��. ��� $ border�� � �� �#2080f0�� 
�������$��15q�$��10,10,10,10q�$
��Auto=�$��Disabled=�$��1q�.���� -    ��Name$ 
configText��$��Consolas)�$��14(� �� 
IsReadOnly$ False��
������ $��0q�$��0,0,0,5q�$K E可手动进行复制，或点按写入即可自动写入配置文件��$	 200��$ 0��$	 60000������ *
ConfigText+$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=�