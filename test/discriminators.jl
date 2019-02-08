@testset "Prompt early late" begin
    A = @SMatrix [i*j for i = 1:3, j = 1:4]
    @test PhasedArrayTracking.early(A) == A[3,:]
    @test PhasedArrayTracking.prompt(A) == A[2,:]
    @test PhasedArrayTracking.late(A) == A[1,:]

    A = @SMatrix [i*j for i = 1:5, j = 1:4]
    @test PhasedArrayTracking.veryearly(A) == A[5,:]
    @test PhasedArrayTracking.early(A) == A[4,:]
    @test PhasedArrayTracking.prompt(A) == A[3,:]
    @test PhasedArrayTracking.late(A) == A[2,:]
    @test PhasedArrayTracking.verylate(A) == A[1,:]
end
