public class MatrixMultiplicationThread extends Thread{
	int[][] res;
	int[][] matA;
	int[][] matB;
	int row;
	public MatrixMultiplicationThread(int[][] res, int[][] matA, int[][] matB, int row) {
		this.res = res;
		this.matA = matA;
		this.matB = matB;
		this.row = row;
	}
	@Override
	public void run() {
		// TODO Auto-generated method stub
		for(int i=0;i<matB[0].length;i++) {
			for(int j=0;j<matA[0].length;j++) {
				res[row][i]+=matA[row][j]*matB[j][i];
			}
		}
	}
}
public class MultiThreadMatrixMultiplication {
public static void main(String[] args) {
	int[][] matA= {{1,2,3},{4,5,6},{7,8,9}};
	int[][] matB= {{1,2,3},{4,5,6},{7,8,9}};
	int rows=matA.length,cols=matA[0].length;
	int[][] res=new int[rows][cols];
	Thread[] thread=new Thread[rows];
	for(int i=0;i<rows;i++) {
		thread[i]=new MatrixMultiplicationThread(res,matA,matB,i);
		thread[i].start();
	}
	for(int i=0;i<rows;i++) {
		try {
			thread[i].join();
		}
		catch (InterruptedException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	System.out.println("Result Matrix");
	for(int[] row:res) {
		for(int val:row)
			System.out.print(val+" ");
		System.out.println();
	}
}
}
