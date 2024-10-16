function openWindow(url) {
    const newWindow = window.open(url, "_blank", "noopener noreferrer");
  
    // Remove all control elements from the new window
    newWindow.document.body.innerHTML = "";
    newWindow.document.documentElement.style.margin = "0";
    newWindow.document.documentElement.style.padding = "0";
  
    // Set the window's size and position (optional)
    newWindow.resizeTo(400, 300);
    newWindow.moveTo(100, 100);
  }