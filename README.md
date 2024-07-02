# Violence-Detection
It is a mobile application for detecting acts of violence in live streams and uploaded videos. This initiative aimed to assist government institutions, schools, and parents in Egypt in detecting violence promptly and taking necessary measures to address the issue effectively. Using flutter, dart, python, colab, deep learning, tensorflow, fastapi.
The goal of this project was to provide an easy way to detect acts of violence that are
currently widespread, to help government institutions such as schools or people such as
parents in Egypt detect acts of violence faster before the problem occurs, and to take
necessary action procedures from the competent authorities.
We applied innovative, cutting-edge methods that have been discovered over the past two
years and are trying to improve, such as SepConvLstm, where we used a powerful new
method to detect violent activity in real-world surveillance footage as RWF2000 Dataset.
The proposed network can learn discriminative spatiotemporal features effectively which
is reflected in the high recognition accuracy on standard datasets. Moreover, it is
computationally efficient, making it suitable for deployment in time-sensitive applications
and low-end devices. We have shown that the SepConvLSTM cell is a compact and robust
alternative to the ConvLSTM cell. Since SepConvLSTM uses fewer parameters, stacking
multiple layers of LSTM with the remaining connections seems feasible and may improve
the results further.
C3D and 3DCNN are both types of convolutional neural networks designed to process
spatiotemporal data (data that includes both spatial and temporal components, meaning that
the data contains information about the location (spatial) and time (temporal) when an
event or observation occurs), such as video clips. While C3D specializes in action
recognition tasks, 3DCNNs can be applied to a wide range of spatiotemporal data analysis
tasks. We also experimented with transform encoders used in many tasks involving
sequential data, such as NLP and time series analysis. Key components include multi-head
self-attention, feedforward neural network, and class normalization which may help in
violence detection.
We performed data analysis to identify and categorize the violent types within RWF-20000
dataset. We extracted meaningful features from a trained 3D Convolutional Neural
Network (3DCNN) model to obtain a feature vector. We performed dimensionality
reduction using techniques such as t-SNE and UMAP, then applied clustering algorithms,
including K-means and DBSCAN. However, with careful examination, we found that these
clusters did not match with the known types of violence that we are familiar with.
