public class CustomProgressBar : ContentView
{
    public static readonly BindableProperty ProgressProperty =
        BindableProperty.Create(nameof(Progress), typeof(double), typeof(CustomProgressBar), 0.0, propertyChanged: OnProgressChanged);

    private static void OnProgressChanged(BindableObject bindable, object oldValue, object newValue)
    {
        ((CustomProgressBar)bindable).UpdateProgress();
    }

    public double Progress
    {
        get => (double)GetValue(ProgressProperty);
        set => SetValue(ProgressProperty, value);
    }

    private BoxView progressBar;

    public CustomProgressBar()
    {
        progressBar = new BoxView { Color = Colors.Green, HeightRequest = 20, HorizontalOptions = LayoutOptions.Start };
        Content = new Grid
        {
            BackgroundColor = Colors.LightGray,
            Children = { progressBar }
        };

        // Event hinzufügen, um die Größe zu überwachen
        SizeChanged += (s, e) => UpdateProgress();

        // Initiale Aktualisierung des Fortschrittsbalkens
        UpdateProgress();
    }

    private void UpdateProgress()
    {
        progressBar.AnchorX = 0;
        progressBar.WidthRequest = Width * Progress;
    }
}
