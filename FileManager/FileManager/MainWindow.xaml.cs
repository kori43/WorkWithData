using System.IO;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace FileManager
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        //Создание файла
        private void CreateFileButton_Click(object sender, RoutedEventArgs e)
        {
            string filePath = FilePath_TextBox.Text;

            try
            {
                if(!File.Exists(filePath))
                {
                    File.WriteAllText(filePath, string.Empty);
                    MessageBox.Show($"Файл успешно создан.", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                }
                else
                {
                    MessageBox.Show("Файл уже существует.", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        // Чтение файла
        private void ReadFileButton_Click(object sender, RoutedEventArgs e)
        {
            string filePath = FilePath_TextBox.Text;

            try
            {
                if(File.Exists(filePath))
                {
                    FileContent_TextBox.Text = File.ReadAllText(filePath);
                }
                else
                {
                    MessageBox.Show("Файл не найден.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        // Запись в файл
        private void WriteFileButton_Click(object sender, RoutedEventArgs e)
        {
            string filePath = FilePath_TextBox.Text;

            try
            {
                File.WriteAllText(filePath, FileContent_TextBox.Text);
                MessageBox.Show("Данные успешно записаны в файл.", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            catch(Exception ex)
            {
                MessageBox.Show($"Ошибка: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        // Добавление текста в файл
        private void AppendFileButton_Click(object sender, RoutedEventArgs e)
        {
            string filePath = FilePath_TextBox.Text;

            try
            {
                File.AppendAllText(filePath, FileContent_TextBox.Text + Environment.NewLine);
                MessageBox.Show("Данные успешно добавлены в файл.", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            catch(Exception ex)
            {
                MessageBox.Show($"Ошибка: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        // Удаление файла
        private void DeleteFileButton_Click(object sender, RoutedEventArgs e)
        {
            string filePath = FilePath_TextBox.Text;

            try
            {
                if(File.Exists(filePath))
                {
                    File.Delete(filePath);
                    FileContent_TextBox.Clear();
                    MessageBox.Show("Файл успешно удален.", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                }
                else
                {
                    MessageBox.Show("Файл не найден.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void ClearButton_Click(object sender, RoutedEventArgs e)
        {
            FilePath_TextBox.Clear();
        }
    }
}