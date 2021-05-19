Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Reference: http://kamifuji.dyndns.org/PS-Support/Form04/index.html

#region form
$form = New-Object System.Windows.Forms.Form
$form.Text = 'Sample'

$icon = [System.Drawing.Icon]::ExtractAssociatedIcon($PSHOME + '\powershell.exe')
$form.Icon = $icon

$imagePath = "C:\Users\<username>\image.jpg"
$image = [System.Drawing.Image]::FromFile($imagePath)
$form.BackgroundImage = $image
$form.BackgroundImageLayout = 'None'  # None, Tile, Center, Stretch, Zoom
$form.Width = $image.Width
$form.Height = $image.Height
$form.FormBorderStyle = 'FixedSingle'

# $form.Width = 250
# $form.Height = 100
# $form.Size = New-Object System.Drawing.Size(300, 200)
# $form.Size = New-Object Drawing.Size @(300, 200)
# $form.MaximumSize = '800, 600'

# $form.AutoScroll = $True

# $form.AutoSize = $True
# $form.AutoSizeMode = 'GrowAndShrink'

# $form.MinimizeBox = $False
# $form.MaximizeBox = $False

$form.FormBorderStyle = 'Fixed3D'  # None, FixedSingle, Fixed3D, FixedDialog, Sizable, FixedToolWindow, SizableToolWindow

# $form.WindowState = 'Normal'  # Maximized, Minimized, Normal
# $form.SizeGripStyle = 'Hide'  # Auto, Hide, Show
# $form.ShowInTaskbar = $False

# $form.BackColor = 'lime'

# $form.Opacity = 0.9

$form.StartPosition = 'Manual'  # CenterScreen, Manual, WindowsDefaultLocation, WindowsDefaultBounds, CenterParent
$form.Location = '300, 200'

$font = New-Object System.Drawing.Font(
    'Times New Roman', 20, [System.Drawing.FontStyle]::Italic)
$form.Font = $font

$form.KeyPreview = $True
$form.Add_KeyDown(
    {
        if ($_.KeyCode -eq 'Enter' -or $_.KeyCode -eq 'Escape') {
            $form.Close()
        }
    }
)
# $form.ShowDialog()
#endregion form

#region calendar
# $calendar = New-Object System.Windows.Forms.MonthCalendar
# $calendar.ShowTodayCircle = $False
# $calendar.MaxSelectionCount = 366
# $form.Controls.Add($calendar)
#endregion calendar

#region messageBox
<#
[System.Windows.Forms.MessageBox]::Show( "A" ,"B" ,"C" ,"D" ,"E" )

　A ... message contents
　B ... windows title
　C ... button types : OK , OKCancel , AbortRetryIgnore , YesNoCancel , YesNo , RetryCancel
　D ... icon types : None , Hand , Error , Stop , Question , Exclamation , Warning , Asterisk , Information
　E ... default select　
#>

# [System.Windows.Forms.MessageBox]::Show(
#     'message', 'title', 'OKCancel', 'Asterisk', 'button2') 
#endregion messageBox

#region button
$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(150, 240)
$okButton.Size = New-Object System.Drawing.Size(150, 46)
$okButton.Text = 'OK'
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$okButton.FlatStyle = 'Popup'
$okButton.BackColor = 'black'
$okButton.ForeColor = 'yellow'
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object system.Drawing.Point(300, 240)
$cancelButton.Size = New-Object System.Drawing.Size(150, 46)
$cancelButton.Text = 'Cancel'
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$cancelButton.FlatStyle = 'Popup'
$cancelButton.BackColor = 'red'
$cancelButton.ForeColor = 'black'
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)
#endregion button

#region label
# $label = New-Object System.Windows.Forms.Label
# $label.Text = 'Please enter the information in the space below: '
# # $label.AutoSize = $True
# $label.Location = New-Object System.Drawing.Point(20, 40)
# $label.Size = New-Object System.Drawing.Size(560, 40)
# $label.BackColor = 'Transparent'
# $label.ForeColor = 'Yellow'
# $form.Controls.Add($label)
#endregion label

#region textbox
# $textbox = New-Object System.Windows.Forms.Textbox
# $textbox.Location = New-Object System.Drawing.Point(20, 80)
# $textbox.Size = New-Object System.Drawing.Size(520, 40)
# $form.Controls.Add($textbox)
#endregion textbox

#region listbox
# $listBox = New-Object System.Windows.Forms.ListBox 
# $listBox.Location = New-Object System.Drawing.Point(20, 80) 
# $listBox.Size = New-Object System.Drawing.Size(520, 40) 
# $listBox.Height = 160

# $listBox.SelectionMode = 'MultiSimple'

# $Button = New-Object System.Windows.Forms.Button
# $Button.Location = "40,200"
# $Button.Size = "75,30"
# $Button.Text = "削除"

# $Delete = {
#     $select = $listBox.SelectedIndices

#     For ($i = $select.count - 1 ; $i -ge 0 ; $i-- ) {
#         $index = $select[$i]

#         $listBox.Items.RemoveAt($index)
#     }
# }
# $Button.Add_Click($Delete)

# [void] $listBox.Items.Add("001")
# [void] $listBox.Items.Add("002")
# [void] $listBox.Items.Add("003")
# [void] $listBox.Items.Add("004")
# [void] $listBox.Items.Add("005")
# [void] $listBox.Items.Add("006")
# [void] $listBox.Items.Add("007")

# [void] $listBox.Items.AddRange(
#     @()
# )

# $form.Controls.Add($listBox) 
#endregion listbox

#region checkbox
# $checkedListBox = New-Object System.Windows.Forms.CheckedListBox
# $checkedListBox.Location = '10, 80'
# $checkedListBox.Size = '440, 300'

# $RETU = ('1', '2', '3', '4', '5', '6', '7')
# $checkedListBox.Items.AddRange($RETU)

# $checkedListBox.ClearSelected()

# $form.Controls.Add($checkedListBox)
#endregion checkbox

#region numericUpDown
# $numericUpDown = New-Object System.Windows.Forms.NumericUpDown
# $numericUpDown.Location = '60, 40'
# $numericUpDown.TextAlign = 'Right'
# $numericUpDown.UpDownAlign = 'Right'
# $numericUpDown.Maximum = '100'
# $numericUpDown.Minimum = '30'
# $numericUpDown.Text = '50'
# $numericUpDown.InterceptArrowKeys = $True

# $form.Controls.Add($numericUpDown)
# $form.ShowDialog()

# $numericUpDown.Text
#endregion numericUpDown

#region progressBar
# $progressBar = New-Object System.Windows.Forms.ProgressBar
# $progressBar.Location = '10, 100'
# $progressBar.Size = '260, 30'
# $progressBar.Maximum = '10'
# $progressBar.Minimum = '0'
# # $progressBar.Style = 'Blocks'
# # $progressBar.Style = "Continuous"
# $progressBar.Style = 'Marquee'
# $progressBar.MarqueeAnimationSpeed = 10

# $form.Controls.Add($progressBar)

# $form.ShowDialog()
#endregion progressBar

#region listView
$listView = New-Object System.Windows.Forms.ListView
$listView.Location = '10, 10'
$listView.Size = '300,150'
$listView.View = 'Details'
$listView.GridLines = $True
$listView.CheckBoxes = $True

[void]$listView.Columns.Add('name', 100)
[void]$listView.Columns.Add('sex', 100)
[void]$listView.Columns.Add('age', 100)

$item1 = New-Object System.Windows.Forms.ListViewItem('naruto')
[void]$item1.SubItems.Add('male')
[void]$item1.SubItems.Add('22')
[void]$listView.Items.Add($item1)
$item1.Checked = $True

$item2 = New-Object System.Windows.Forms.ListViewItem('sakura')
[void]$item2.SubItems.Add('female')
[void]$item2.SubItems.Add('21')
[void]$listView.Items.Add($item2)
$item2.Checked = $True

$form.Controls.Add($listView)

$form.ShowDialog()

foreach ($item in $listView.Items) {
    if ($item.Checked -eq $True) {
        $item.Text
    }
}
#endregion listView

#region result
# $form.TopMost = $True

# $form.Add_Shown( { $textbox.Select() })
# $result = $form.ShowDialog()

# # textbox
# if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
#     $x = $textbox.Text
#     $x
# }

# # listview
# if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
#     $x = $listView.SelectedIndices
#     $x
# }

# # listbox
# if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
#     $x = $listBox.SelectedItem
#     $x
#     $x.count
# }

# # calendar
# if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
#     $date = $calendar.SelectionStart
#     Write-Host "Date selected Start: $($date.ToShortDateString())"
#     $date2 = $calendar.SelectionEnd
#     Write-Host "Date selected End: $($date2.ToShortDateString())"
#     $calendar.SelectionRange.Start
#     $calendar.SelectionRange.End
# }

# # checkbox
# if ( $result -eq "OK" ) {
#     $AAA = @($checkedListBox.CheckedItems)
#     $AAA
# }
# else {
#     exit
# }
#endregion result

#region draw
# [void][reflection.assembly]::LoadWithPartialName('System.Windows.Forms')
# [void][reflection.assembly]::LoadWithPartialName('System.Drawing')

# $myBrush = New-Object Drawing.SolidBrush green
# $myPen = New-Object Drawing.Pen black

# $rect = New-Object Drawing.Rectangle 50, 50, 240, 240

# $formGraphics = $form.CreateGraphics()

# $form.add_paint(
#     {
#         $formGraphics.FillEllipse($myBrush, $rect)

#         $myPen.Color = 'red'
#         $myPen.Width = 5

#         $formGraphics.DrawLine($myPen, 50, 50, 240, 240)
#         $formGraphics.DrawLine($myPen, 240, 50, 50, 240)
#     }
# )
#endregion draw

#region groupbox
# function Cheesy_Form($firstName, $lastName) {
#     [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
#     [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 

#     $form = New-Object System.Windows.Forms.Form
#     $form.width = 500
#     $form.height = 300
#     $form.Text = 'My Cheesy Form with Radio buttons'
#     # $form.BackColor = 'lime'

#     $font = New-Object System.Drawing.Font('Times New Roman', 12)
#     $form.Font = $font
 
#     $myGroupBox = New-Object System.Windows.Forms.GroupBox
#     $myGroupBox.Location = '40,30'
#     $myGroupBox.Size = '400,150'
#     $myGroupBox.Text = "Hey! $firstName $lastName! Do you like Cheese?"

#     $radioButton1 = New-Object System.Windows.Forms.RadioButton
#     $radioButton1.Location = '20,40'
#     $radioButton1.Size = '350,20'
#     $radioButton1.Checked = $True 
#     $radioButton1.Text = "Yes - I like Cheese."
 
#     $radioButton2 = New-Object System.Windows.Forms.RadioButton
#     $radioButton2.Location = '20,70'
#     $radioButton2.Size = '350,20'
#     $radioButton2.Checked = $False
#     $radioButton2.Text = "No - I don't like Cheese."
 
#     $radioButton3 = New-Object System.Windows.Forms.RadioButton
#     $radioButton3.Location = '20,100'
#     $radioButton3.size = '350,20'
#     $radioButton3.Checked = $false
#     $radioButton3.Text = "Sometimes - Depending on the type of cheese."
 
#     $okButton = New-Object System.Windows.Forms.Button
#     $okButton.Location = '130,200'
#     $okButton.Size = '100,40' 
#     $okButton.Text = 'OK'
#     $okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
 
#     $cancelButton = New-Object System.Windows.Forms.Button
#     $cancelButton.Location = '255,200'
#     $cancelButton.Size = '100,40'
#     $cancelButton.Text = "Cancel"
#     $cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
 
#     $form.Controls.AddRange(@($myGroupBox, $okButton, $cancelButton))
 
#     $myGroupBox.Controls.AddRange(@($radioButton1, $radioButton2, $radioButton3))

#     $form.AcceptButton = $OKButton
#     $form.CancelButton = $CancelButton

#     $form.Add_Shown( { $form.Activate() })

#     $dialogResult = $form.ShowDialog()

#     if ($dialogResult -eq "OK") {
#         if ($RadioButton1.Checked) {
#             [System.Windows.Forms.MessageBox]::Show("You like cheese." , "Great")
#         }
#         elseif ($RadioButton2.Checked) {
#             [System.Windows.Forms.MessageBox]::Show("So your not a fan of cheese." , "Awe")
#         }
#         elseif ($RadioButton3.Checked = $True) {
#             [System.Windows.Forms.MessageBox]:: `
#                 Show("That's OK - some cheeses have a strong taste" , "On the fence")
#         }
#     }
# }

# Cheesy_Form $args[0] $args[1]
#endregion groupbox

#region BrowseForFolder
# $shell = New-Object -com Shell.Application

# $folderPath = $shell.BrowseForFolder(0, "Select target folder", 0, "C:\")

# if ($null -eq $folderPath) {
#     exit
# }

# $PATH = $folderPath.Self.Path

# [System.Windows.Forms.MessageBox]::Show($PATH, "execution complete")
#endregion BrowseForFolder

#region FolderBrowserDialog
# Set-StrictMode -Version Latest

# $dialog = New-Object System.Windows.Forms.FolderBrowserDialog

# $dialog.Description = "select test folder"

# $dialog.ShowNewFolderButton = $False

# $dialog.SelectedPath = "C:\Users\<username>\Documents"

# If ($dialog.ShowDialog() -eq "OK") {
#     $dialog.SelectedPath
# }
# Else {
#     "nothing selected"
# }
#endregion FolderBrowserDialog

#region SaveFileDialog
# $dialog = New-Object System.Windows.Forms.OpenFileDialog

# $dialog.Title = 'Please select the file'

# $dialog.ShowHelp = $True

# $dialog.InitialDirectory = 'Desktop'

# $dialog.MultiSelect = $True

# if ($dialog.ShowDialog() -eq "OK") {
#     $PATH = $dialog.FileNames
# }
# else {
#     $PATH = 'Nothing selected'
# }

# [System.Windows.Forms.MessageBox]::Show($PATH, "execution complete")
#endregion SaveFileDialog

#region ColorDialog
# $dialog = New-Object System.Windows.Forms.ColorDialog
# $result = $dialog.ShowDialog()

# if ($result -eq 'OK') {
#     $color = $dialog.Color
#     [System.Windows.Forms.MessageBox]::Show("$color is selected")
# }
#endregion ColorDialog
