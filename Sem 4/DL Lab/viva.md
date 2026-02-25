# Complete Deep Learning Viva Questions with Answers

## LAB 1: MLP on MNIST

### Theory Questions

**1. What is an MLP (Multi-Layer Perceptron)?**
Feedforward neural network with input layer, one or more hidden layers, and output layer, all fully connected.

**2. What is a feedforward neural network?**
Network where information flows only in one direction - from input to output, no cycles/loops.

**3. What is the difference between shallow and deep neural networks?**
Shallow: 1 hidden layer. Deep: Multiple hidden layers (2+). Deep networks learn hierarchical features.

**4. What is hierarchical feature extraction?**
Early layers learn simple features (edges), deeper layers combine them into complex features (shapes, objects).

**5. Why do deeper networks sometimes perform better?**
Can learn more complex patterns, hierarchical representations, and abstract features.

**6. What is the vanishing gradient problem?**
Gradients become very small in early layers during backpropagation, making learning slow/impossible. Solved by ReLU, batch norm, skip connections.

**7. What is the MNIST dataset?**
Handwritten digits (0-9), 60,000 training + 10,000 test images, 28×28 grayscale, 10 classes.

**8. What are the dimensions of MNIST images?**
28×28 pixels, grayscale (1 channel).

### Code-Specific Questions

**9. Why reshape input to `(-1, 28*28)`?**
Flatten 28×28 images into 784-dimensional vectors for MLP input.

**10. What does `-1` mean in reshape?**
Auto-calculate dimension based on total elements (here: number of samples).

**11. Why divide by 255.0? What is this called?**
Normalization - scales pixel values from [0,255] to [0,1] for better training.

**12. Why use `.astype("float32")`?**
Convert integers to floats for neural network computations and memory efficiency.

**13. What does `keras.Sequential()` do?**
Creates model as linear stack of layers, one after another.

**14. What is `layers.Input(shape=(784,))`?**
Defines input layer expecting 784 features (flattened image).

**15. What is `layers.Dense()`?**
Fully connected layer - every neuron connects to all neurons in previous layer.

**16. What do numbers 512, 256, 128 represent?**
Number of neurons/units in each hidden layer.

**17. What is ReLU activation? Formula?**
f(x) = max(0, x). Outputs x if positive, else 0. Introduces non-linearity.

**18. Why use ReLU instead of sigmoid in hidden layers?**
Avoids vanishing gradient, computationally efficient, sparse activation.

**19. What is Softmax activation?**
Converts logits to probability distribution summing to 1. Formula: e^xi / Σe^xj

**20. Why Softmax with 10 neurons in output?**
10-class classification (digits 0-9), outputs probability for each class.

**21. What is Adam optimizer?**
Adaptive learning rate optimizer combining momentum + RMSprop. Adapts per-parameter learning rates.

**22. What does `1e-3` mean?**
0.001 - the learning rate.

**23. What is `sparse_categorical_crossentropy`?**
Loss for multi-class classification when labels are integers (0,1,2...), not one-hot.

**24. When use `categorical_crossentropy` instead?**
When labels are one-hot encoded (e.g., [0,0,1,0,0,0,0,0,0,0] for digit 2).

**25. What does `metrics=["accuracy"]` do?**
Tracks accuracy during training/evaluation for monitoring.

**26. What is `validation_split=0.1`?**
Uses 10% of training data for validation during training.

**27. What is `batch_size=64`?**
Number of samples processed before one weight update.

**28. What is an epoch?**
One complete pass through entire training dataset.

**29. Why 5 epochs?**
Balance between underfitting (too few) and overfitting (too many). Monitor validation loss.

**30. What does `model.evaluate()` return?**
[loss_value, accuracy_value] - metrics on test data.

**31. What does `verbose=0` do?**
Silent mode - no output printed during evaluation.

### Output Interpretation

**32. What do `844/844` batches mean?**
54,000 samples (90% of 60,000) ÷ 64 batch_size ≈ 844 batches per epoch.

**33. Why training accuracy increases while loss decreases?**
Model learning correctly - lower loss means better predictions.

**34. Validation accuracy << training accuracy means?**
Overfitting - model memorizes training data, doesn't generalize.

**35. Why not 100% accuracy?**
Ambiguous digits, limited model capacity, inherent data noise.

**36. Why deep MLP performs better than shallow?**
More layers = more feature abstraction = better pattern recognition.

---

## LAB 2: CNN on Fashion-MNIST / CIFAR-10

### Theory Questions

**37. What is CNN?**
Neural network using convolution operations to extract spatial features from images.

**38. What is convolution?**
Sliding filter/kernel over image, computing dot products to create feature maps.

**39. What are convolutional filters/kernels?**
Small matrices (e.g., 3×3) that detect specific features like edges, textures.

**40. What is pooling?**
Downsampling operation reducing spatial dimensions while retaining important features.

**41. Max Pooling vs Average Pooling?**
Max: takes maximum value in window. Average: takes mean. Max preserves prominent features.

**42. Why CNN better than MLP for images?**
Parameter sharing, translation invariance, preserves spatial relationships, fewer parameters.

**43. What is parameter sharing?**
Same filter weights used across entire image, reducing parameters.

**44. What is translation invariance?**
Model recognizes features regardless of position in image.

**45. What is receptive field?**
Region of input that affects a particular neuron's output.

### Code-Specific Questions

**46. Why `x_train[..., None]` in Fashion-MNIST?**
Adds channel dimension: (N,28,28) → (N,28,28,1) for Conv2D input.

**47. Why CIFAR-10 doesn't need this?**
Already has 3 channels (RGB): shape is (N,32,32,3).

**48. Explain `Conv2D(32, (3,3), padding="same", activation="relu")`**
32 filters, 3×3 kernel size, same padding (output=input size), ReLU activation.

**49. What is "same" padding?**
Zero-pads input so output spatial dimensions equal input dimensions.

**50. What is "valid" padding?**
No padding - output dimensions reduce by (kernel_size - 1).

**51. What does `MaxPool2D((2,2))` do?**
Takes max value in each 2×2 window, reduces dimensions by half.

**52. Why use MaxPooling?**
Reduces computation, provides translation invariance, reduces overfitting.

**53. What does `Flatten()` do?**
Converts 2D feature maps (H×W×C) to 1D vector for Dense layers.

**54. Output shape after Conv2D(32) + MaxPool on 32×32×3?**
Conv2D: 32×32×32, MaxPool: 16×16×32

**55. After second Conv2D(64) + MaxPool + Flatten?**
Conv2D: 16×16×64, MaxPool: 8×8×64, Flatten: 4096

**56. Why Fashion-MNIST (90%) > CIFAR-10 (69%)?**
Fashion-MNIST: simpler grayscale images. CIFAR-10: complex RGB natural images.

**57. Training 84%, Test 69% - what's happening?**
Overfitting - model memorizes training data but fails to generalize.

**58. How to reduce overfitting?**
Add Dropout, data augmentation, L2 regularization, early stopping, reduce model size.

**59. Dataset difference - Prof vs You?**
Prof: Fashion-MNIST (28×28×1). You: CIFAR-10 (32×32×3).

**60. Why different input shapes?**
Fashion-MNIST: grayscale. CIFAR-10: color RGB images.

---

## LAB 3: Transfer Learning vs Shallow NN

### Professor's Code (Transfer Learning)

**61. What is Transfer Learning?**
Using pretrained model weights from one task to accelerate learning on new task.

**62. What is fine-tuning?**
Unfreezing some pretrained layers and training them with low learning rate on new data.

**63. Why use pretrained ImageNet weights?**
Generic features (edges, shapes, textures) transfer well to other image tasks.

**64. What is ResNet50?**
50-layer deep residual network with skip connections to avoid vanishing gradients.

**65. What does `include_top=False` mean?**
Exclude final classification layers, keep only feature extraction layers.

**66. What does `weights="imagenet"` mean?**
Load weights pretrained on 1.2M ImageNet images.

**67. Why freeze base model (`trainable=False`)?**
Preserve pretrained features; avoid destroying them with large gradients on small dataset.

**68. What is GlobalAveragePooling2D?**
Averages each feature map to single value. (H×W×C) → (C)

**69. Why GlobalAveragePooling2D over Flatten?**
Fewer parameters, less overfitting, flexible input sizes.

**70. What is data augmentation?**
Creating variations of training images (flip, rotate, zoom) to increase dataset size and reduce overfitting.

**71. What does `RandomFlip("horizontal")` do?**
Randomly flips images horizontally with 50% probability.

**72. What does `RandomRotation(0.1)` do?**
Rotates images randomly by ±10% of 360° (±36°).

**73. Why lower learning rate (1e-4) for fine-tuning?**
Preserve pretrained features; avoid large updates that destroy learned patterns.

**74. What does `base_model.layers[:-30]` mean?**
All layers except last 30 - these stay frozen during fine-tuning.

**75. Why unfreeze only top layers?**
Lower layers: general features (keep frozen). Upper layers: task-specific (retrain).

**76. What is `image_dataset_from_directory()`?**
Creates dataset from folder structure where subfolder names become class labels.

### Your Code (Shallow NN on make_moons)

**77. What is make_moons dataset?**
Synthetic 2D dataset with two interleaving half-circles, 2 classes.

**78. Why use make_moons?**
Simple non-linear problem to demonstrate neural network learning.

**79. What is StandardScaler?**
Standardizes features to zero mean and unit variance.

**80. Why scale/standardize features?**
Equal feature contribution, faster convergence, better gradient descent.

**81. `fit_transform()` vs `transform()`?**
fit_transform: learn parameters + apply. transform: only apply learned parameters.

**82. Why fit_transform on train, transform on test?**
Prevent data leakage - test data shouldn't influence preprocessing.

**83. Why only 10 neurons?**
Simple 2D problem doesn't need complex model; prevents overfitting.

**84. Why your Lab 3 differs from prof's handout?**
Different experiment - you did shallow NN on synthetic data, prof showed transfer learning.

---

## LAB 4: Healthcare CNN (Malaria/Pneumonia)

### Theory Questions

**85. Why CNN for medical images?**
Learns relevant features automatically, captures spatial patterns, high accuracy.

**86. What is DenseNet? vs ResNet?**
DenseNet: each layer connected to ALL subsequent layers. Better feature reuse, fewer parameters than ResNet.

**87. What does DenseNet121 mean?**
DenseNet architecture with 121 layers.

**88. What is AUC?**
Area Under ROC Curve. Measures discrimination ability. 1.0=perfect, 0.5=random.

**89. Why AUC for medical diagnosis?**
Works well with imbalanced data, considers all thresholds, clinically meaningful.

**90. What is class imbalance?**
Unequal samples per class. Model biases toward majority class.

**91. What are class weights?**
Penalize errors on minority class more heavily to balance learning.

**92. What is Dropout?**
Randomly sets fraction of neurons to 0 during training. Regularization technique.

**93. What does `Dropout(0.3)` mean?**
30% of neurons randomly dropped each training step.

### Code-Specific Questions

**94. What does `label_mode="binary"` do?**
Labels as single 0 or 1 value for binary classification.

**95. Why sigmoid in output for binary classification?**
Outputs probability [0,1] for positive class.

**96. Why binary_crossentropy loss?**
Appropriate loss for two-class classification problems.

**97. What is `keras.metrics.AUC(name="auc")`?**
Computes AUC metric during training/evaluation.

**98. Why train/val/test split (70/15/15)?**
Train: learning. Val: hyperparameter tuning. Test: final unbiased evaluation.

**99. What is `shutil.copy()`?**
Python function to copy files between directories.

**100. Why folder structure for image classification?**
Required by `image_dataset_from_directory()` - folder names = class labels.

**101. AUC 0.98 means?**
Excellent - 98% chance model ranks random positive higher than random negative.

**102. Why not accuracy alone for medical?**
Misleading with imbalanced data. AUC, sensitivity, specificity more meaningful.

**103. What is sensitivity/recall in medical context?**
True Positive Rate - proportion of actual positives correctly identified. Critical for disease detection.

**104. What is Grad-CAM?**
Visualization showing which image regions influenced prediction using gradients.

**105. Prof (pneumonia) vs You (malaria) - similarity?**
Both: binary medical image classification using DenseNet transfer learning.

**106. `class_weight={0:1.0, 1:2.0}` means?**
Misclassifying positive class (1) penalized 2× more than negative class (0).

---

## LAB 5: LSTM Sentiment Analysis

### Theory Questions

**107. What is RNN?**
Recurrent Neural Network - processes sequences with hidden state carrying information across time steps.

**108. RNN problem with long sequences?**
Vanishing gradient - can't learn long-term dependencies effectively.

**109. What is LSTM?**
Long Short-Term Memory - RNN with gates controlling information flow, handles long sequences.

**110. LSTM gates?**
Forget gate: what to discard. Input gate: what to store. Output gate: what to output.

**111. What is cell state?**
LSTM's memory highway carrying information across many time steps.

**112. What is Bidirectional LSTM?**
Processes sequence forward AND backward, captures context from both directions.

**113. Why Bidirectional for sentiment?**
Later words can affect meaning of earlier words ("not good" vs "good").

**114. What is tokenization?**
Converting text words to integer indices.

**115. What is padding?**
Making all sequences same length by adding zeros (usually at beginning).

**116. What is Embedding layer?**
Learns dense vector representations for words (word → vector of floats).

### Code-Specific Questions

**117. `vocab_size=20000` means?**
Consider only top 20,000 most frequent words; others become OOV.

**118. `max_len=200` means?**
Maximum sequence length. Longer truncated, shorter padded.

**119. What is `oov_token='<OOV>'`?**
Token for out-of-vocabulary (unknown) words.

**120. What does `pad_sequences()` do?**
Pads/truncates sequences to uniform length. Default: prepend zeros.

**121. `Embedding(20000, 100, input_length=max_len)` means?**
20,000 vocabulary, 100-dimensional vectors, sequence length max_len.

**122. What is embedding dimension (100)?**
Size of word vectors. Larger = more expressive but more parameters.

**123. `return_sequences=False` means?**
Return only final LSTM output, not all timesteps.

**124. When use `return_sequences=True`?**
Stacking multiple LSTM layers, or need output at each timestep.

**125. `Bidirectional(LSTM(128))` output dimension?**
256 (128 forward + 128 backward).

**126. What is Sentiment140 dataset?**
1.6 million tweets labeled positive (4) or negative (0).

**127. Why `df['target'].replace(4, 1)`?**
Convert original labels (0,4) to standard binary (0,1).

**128. Why sample only 50,000?**
Computational efficiency for demonstration.

**129. What is Early Stopping?**
Stops training when validation loss stops improving.

**130. `patience=2` means?**
Stop if no improvement for 2 consecutive epochs.

**131. `restore_best_weights=True` does?**
After stopping, restore weights from best epoch.

**132. Your 76% vs Prof's expected 88%?**
Different dataset (tweets vs IMDb reviews), shorter texts, smaller data.

**133. Train 89%, Test 76% - what's happening?**
Overfitting despite regularization.

**134. How to improve?**
Pretrained embeddings (GloVe), more data, attention mechanism, better preprocessing.

**135. GlobalAveragePooling1D instead of LSTM?**
Simple baseline - averages word embeddings, no sequence modeling.

---

## General Deep Learning Questions

### Fundamentals

**136. Supervised vs Unsupervised learning?**
Supervised: labeled data (classification, regression). Unsupervised: no labels (clustering, dimensionality reduction).

**137. What is loss function? Examples?**
Measures prediction error. MSE (regression), CrossEntropy (classification), Binary CrossEntropy.

**138. What is gradient descent?**
Optimization algorithm minimizing loss by updating weights in direction of negative gradient.

**139. What is backpropagation?**
Algorithm computing gradients by chain rule, propagating error backward through network.

**140. Learning rate effects?**
Too high: overshoots minimum, diverges. Too low: very slow convergence.

**141. Hyperparameter vs Parameter?**
Hyperparameter: set before training (learning rate, layers). Parameter: learned during training (weights).

**142. What is overfitting? Detection?**
Model memorizes training data, fails on new data. Detected: high train accuracy, low val/test accuracy.

**143. What is underfitting?**
Model too simple to capture patterns. Both train and test accuracy low.

**144. What is regularization? Techniques?**
Prevents overfitting. Techniques: L1/L2, Dropout, early stopping, data augmentation.

**145. Bias-variance tradeoff?**
High bias: underfitting. High variance: overfitting. Goal: balance both.

### Activation Functions

**146. Why activation functions needed?**
Introduce non-linearity; without them, network is just linear transformation.

**147. Compare ReLU, Sigmoid, Tanh, Softmax?**
ReLU: max(0,x), hidden layers. Sigmoid: 0-1, binary output. Tanh: -1 to 1. Softmax: multi-class probabilities.

**148. What is Leaky ReLU?**
f(x) = x if x>0, else αx (small α like 0.01). Avoids dying ReLU.

**149. Dying ReLU problem?**
Neurons output 0 for all inputs, gradients become 0, neuron never activates again.

### Optimizers

**150. What is SGD?**
Stochastic Gradient Descent - updates weights using gradient from random mini-batch.

**151. What is momentum?**
Accelerates SGD by adding fraction of previous update, helps escape local minima.

**152. Why Adam is popular?**
Combines momentum + adaptive learning rates. Works well with default parameters.

**153. Learning rate scheduling?**
Reducing learning rate during training (e.g., after certain epochs) for fine convergence.

### Regularization

**154. L1 vs L2 regularization?**
L1: adds |w| to loss, sparse weights. L2: adds w² to loss, small weights.

**155. How Dropout works?**
Randomly sets neurons to 0 during training. Forces network to learn redundant representations.

**156. What is Batch Normalization?**
Normalizes layer inputs to zero mean, unit variance. Faster training, regularization effect.

**157. Data augmentation examples?**
Flip, rotate, zoom, crop, color jitter, noise addition.

**158. How early stopping works?**
Monitor validation loss, stop when it stops improving for 'patience' epochs.

### Training Concepts

**159. Batch size effects?**
Small: noisy gradients, better generalization. Large: stable gradients, faster, may overfit.

**160. Epoch vs Iteration?**
Epoch: one pass through entire dataset. Iteration: one weight update (one batch).

**161. Validation set purpose?**
Tune hyperparameters, monitor overfitting during training.

**162. What is cross-validation?**
Multiple train-val splits, average results. K-fold: divide data into K parts, rotate validation set.

**163. Why train-val-test split?**
Train: learn. Val: tune hyperparameters. Test: final unbiased evaluation.

### Evaluation Metrics

**164. When is accuracy misleading?**
Imbalanced datasets - 95% negative class → always predicting negative gives 95% accuracy.

**165. Precision vs Recall?**
Precision: TP/(TP+FP) - of predicted positives, how many correct? Recall: TP/(TP+FN) - of actual positives, how many found?

**166. What is F1 score?**
Harmonic mean of precision and recall: 2×(P×R)/(P+R)

**167. What is confusion matrix?**
Table showing TP, TN, FP, FN counts for classification.

**168. ROC curve and AUC?**
ROC: TPR vs FPR at various thresholds. AUC: area under ROC, overall discrimination ability.

### Architecture Questions

**169. MLP vs CNN?**
MLP: fully connected, for tabular data. CNN: convolutions, for spatial data (images).

**170. CNN vs RNN?**
CNN: spatial patterns (images). RNN: sequential patterns (text, time series).

**171. When to use MLP vs CNN vs RNN?**
MLP: tabular. CNN: images, spatial. RNN/LSTM: sequences, text, time series.

**172. Skip/residual connections?**
Add input to output of layer block. Helps gradient flow, enables very deep networks.

**173. What is pretrained model?**
Model trained on large dataset, weights reused for new tasks (transfer learning).

### Practical Questions

**174. Handle imbalanced datasets?**
Class weights, oversampling minority, undersampling majority, SMOTE, different metrics.

**175. How to choose layers/neurons?**
Start simple, increase if underfitting. Use validation performance to guide.

**176. Debug non-learning network?**
Check data loading, normalize inputs, lower learning rate, check loss function, simplify model.

**177. Why GPU for deep learning?**
Parallel processing of matrix operations. 10-100× faster than CPU.

**178. What is TensorFlow/Keras?**
TensorFlow: Google's deep learning framework. Keras: high-level API (now part of TensorFlow).

---

## Code Tracing Questions

**179. Shape of x_train after reshaping MNIST?**
(60000, 784)

**180. Trainable parameters in shallow MLP?**
784×128 + 128 + 128×10 + 10 = 101,770

**181. Trainable parameters in deep MLP?**
784×512+512 + 512×256+256 + 256×128+128 + 128×10+10 = 535,818

**182. Output after Conv2D(32) on 28×28×1 (same padding)?**
28×28×32

**183. Output after MaxPool2D(2,2) on 28×28×32?**
14×14×32

**184. Output after Flatten on 7×7×64?**
3136

**185. Output shape of Embedding(20000,100) for length 200?**
(batch_size, 200, 100)

**186. Output shape of Bidirectional LSTM(128)?**
(batch_size, 256)

---

## Debugging Questions

**187. Loss is NaN - causes?**
Learning rate too high, exploding gradients, division by zero, invalid data.

**188. Accuracy stuck at 10% for 10-class?**
Random guessing. Check: data loading, labels, learning rate, model architecture.

**189. Val accuracy > train accuracy?**
Dropout active only during training; or possible data leakage.

**190. Train 99%, Test 50% - fix?**
Severe overfitting. Add dropout, regularization, data augmentation, early stopping, reduce model size.

---

## Comparison Questions

**191. Shallow vs Deep MLP accuracy?**
Deep slightly better (~97.6% vs ~97.6%) due to more feature abstraction.

**192. Fashion-MNIST vs CIFAR-10 CNN accuracy?**
Fashion-MNIST ~90%, CIFAR-10 ~70%. CIFAR harder (RGB, complex objects).

**193. Frozen vs Fine-tuned accuracy?**
Fine-tuned usually higher - adapts pretrained features to specific task.

**194. LSTM vs Average embedding?**
LSTM captures word order/context, average embedding ignores sequence.

**195. Binary vs Multi-class setup difference?**
Binary: 1 output neuron, sigmoid, binary_crossentropy. Multi-class: N neurons, softmax, categorical_crossentropy.

---

## Modification Questions

**196. Add more CNN layers?**
Add Conv2D+MaxPool blocks before Flatten. Example: Conv2D(128) + MaxPool.

**197. Multi-class malaria classification?**
Change label_mode="categorical", output Dense(num_classes, activation="softmax"), loss="categorical_crossentropy".

**198. Add attention to LSTM?**
Use `layers.Attention()` after LSTM with return_sequences=True.

**199. Use pretrained embeddings (GloVe)?**
Load GloVe vectors, create embedding matrix, pass to Embedding layer with trainable=False.

**200. Implement k-fold cross validation?**
Use sklearn's KFold, train model K times with different splits, average results.

---

## Quick Fire (Most Likely)

| Question | Answer |
|----------|--------|
| Your model's input shape? | Lab1: (784,), Lab2: (32,32,3), Lab4: (224,224,3), Lab5: (100,) |
| Your model's output shape? | Lab1: (10,), Lab2: (10,), Lab4: (1,), Lab5: (1,) |
| Why these hyperparameters? | Standard starting points, empirically effective |
| Remove a layer effect? | Less capacity, possibly underfitting |
| How to improve accuracy? | More data, augmentation, deeper model, regularization |
| Training time? | Lab1: ~30s, Lab2: ~6min, Lab4: ~18min, Lab5: ~1min |
| Errors faced? | CUDA warnings (ignorable), memory issues, overfitting |

---

**Good luck with your viva! 🎯**
