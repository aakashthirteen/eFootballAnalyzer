import SwiftUI
import ReplayKit

struct ContentView: View {
    @State private var isRecording = false
    let recorder = RPScreenRecorder.shared()

    var body: some View {
        VStack(spacing: 20) {
            Text("eFootball Match Analyzer")
                .font(.title)
            
            Button(action: {
                isRecording ? stopCapture() : startCapture()
            }) {
                Text(isRecording ? "Stop Capture" : "Start Capture")
                    .padding()
                    .background(isRecording ? Color.red : Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }

    func startCapture() {
        recorder.isMicrophoneEnabled = false  // no audio capture initially

        recorder.startCapture(handler: { (sampleBuffer, sampleBufferType, error) in
            if let error = error {
                print("Capture Error: \(error.localizedDescription)")
                return
            }

            if sampleBufferType == .video {
                // This is where we'll later process frames with OCR
                print("Video frame captured.")
            }
        }, completionHandler: { error in
            if let error = error {
                print("Error starting capture: \(error.localizedDescription)")
            } else {
                isRecording = true
                print("Capture started successfully.")
            }
        })
    }

    func stopCapture() {
        recorder.stopCapture { error in
            if let error = error {
                print("Error stopping capture: \(error.localizedDescription)")
            } else {
                isRecording = false
                print("Capture stopped.")
            }
        }
    }
}
